Return-Path: <linux-arm-msm+bounces-105014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SG92HVPW8GkSZQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 17:46:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C71B48827D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 17:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF37C310C1EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA10244BCA1;
	Tue, 28 Apr 2026 14:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b9/Glt7C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YpZBUvZ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514AA43D513
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777386197; cv=none; b=Qcy2lSB17vKl3zqtQXFPOeR+AC77quvmpTCeZF/NXxLBq4Q8ARC4yYWwa7kD0pTJWbqadZAl+lcxMGzYWH1zI74gVpeiBhleSHLwcN72hyqxzCeV7gvjuhhtpoQkcldsvblnLEbZGs71Cb0kgJAOZOrvQ7xrc2Ym9qZWO+70Sp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777386197; c=relaxed/simple;
	bh=HbSuGEQLc59Sraj4LOcdwW5GSnwxN+lPZ5bkvzKitxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RnxMqDEHNQnZuFJi25PTk+4uwZuET6lRFIBKzVdpiNDDXJwWUXHD2IkBQGz9AORtQy0a+0MUDV8dgeEiyhf78HMleHtaRzvlBVFC2PF6/dI5En+KoXiVCiraTSH5I8aRiU/7nzOVVGd2Shnrfd350aZNM+WJw4okCQlvej1LsBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b9/Glt7C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YpZBUvZ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SACOwD2928898
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2wf6P+dIy3swdOfFQ6eaG3P+EchYwJG+lt6mzyhgaNE=; b=b9/Glt7CpnTksk6T
	JGcQezNXo9AYJwE+b5mnK5BrfZG7lJBvUp/8nVtf1RGaGlCsbmGdR6JreCi0WCxo
	vRt4PILMYInu1zP/3mtX5lO2ousrHul6pzCPMiO2njRYYFUP6dJn1wUKUOQrr3+5
	aq0lEqW0hhN5k2tjlcmBkLPJmVJfQeXMN7EM8uz9+Eyl8pqV56LPqmHFPoOvYv5S
	tJRwF0UNC0phdM+4Cu8Nrt2EfD9lFLmLCXQ4ktIgZycxL0RlP/tn0jMjhE4JZlUS
	uVhHNa94P9G+ICy1K6vWHqD7qZnCOd7Oeowdi2oUXSXwybgLW9mQ0ueNBUHeZrN9
	aSE4fg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttxh8wqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:23:14 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56ee7e84f9eso7830079e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777386193; x=1777990993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wf6P+dIy3swdOfFQ6eaG3P+EchYwJG+lt6mzyhgaNE=;
        b=YpZBUvZ9cxizlqEsW0Jimm4pXwc7NExsyh0AK8+jh+SEPVdmgK7B6FvjFdyZY5lfuz
         H5usgo9lHyVjUtFRk5suGHJ1y5N7q/M2gC+7dehwSzGDAUvNHPgJLBf6Qs7WCtxyj6sm
         jqP8MccmbOcgxD3NoAnzSV3QsT2fUJPnkSnI1ea836DxnoMpQerS9ACRWSdbCZIWRxUg
         qUl5sfU0p9y/cueeL3KLtmK9sPJgMG72j+ke/ZwO3ez1sopUQwX4FvpEe4uRIf+DS8yC
         mk7SUFoTSLZ/6ZdbaHz7mf9go++S9t08uaeLp+ykqJcrG8pDXFqSy1odJFqZX6NkGtKI
         XPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386193; x=1777990993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2wf6P+dIy3swdOfFQ6eaG3P+EchYwJG+lt6mzyhgaNE=;
        b=XVcu+Wd2hIpR7bo7QgsQcT8npNtcnTGNjmyYR2q0uJ8ba4ZzwcoSPWrb64eGSZtZjK
         U0T0LmvVFfuBX6fKlEuC5nrY0SUHVHvW/lncOpBdhPz6ViXNV1O3Rmj9kmtvMFDZc09i
         1VuCjjqgzEyyEG+viv3RTAqy3dZbV9D8yodguv4vah3y6gFqsCBb2vtbDwtMpxUwTIiL
         cW4FQyPIspcQFsYSy8lJ4RkWzlUAT1suz1+Jp6j2HL+hNXidTpMq416CbBjTZlpkEeHF
         OHc/6XCu401frcHjJRhfyY4rBpdTvjtN9fsHChKKM0izMmkHetohantivHeauDi5JgzO
         BzTA==
X-Forwarded-Encrypted: i=1; AFNElJ/bBTDkDBIerTVq9Cn73FdfE/yXsQwk89dSnhnZhi1PaPr7MkO4XXvktyO+tMWMid2fRJ2VyIJChEM2uSRS@vger.kernel.org
X-Gm-Message-State: AOJu0YwiPpj9UUOW/MoQFFVz1YcAcNOwwh/33575eu57oczkWUT4ShXi
	ZZKt9ooXf7wpMvGfhS6xeebb5Bjf0MOCnnCX+rOOUyihabZt9AgqYwFn9mQ8KD7pJJsJybb1VLy
	3jnEnoTnO5CZw6EFksMgPyKmDyPAQbbY1v6BlqrxuOA+ixVr6XXK5G9I1tmD1sNQjoBMv
X-Gm-Gg: AeBDieuhNeabPysLnzux1R2GplpA1F52xvDA8jZ1XYccCv/escYoBPLaSW3ytGIEBns
	bMkSUQMlwsVPcyx26xJhLO/LSfc521BrXVrWDwKMeYbrlCzBWCUk1YNRoJ83C2ue1zZrqh8noQP
	R02wu0oNiBrRpRgepIRGjkfBSofj5b2xtjlQGRSakYgfc2U6Jq+F5XIXh0F/+GefJy9qZBb1i5n
	o7P2w5wmbeACcpw3gQ9zGRAsiJiF+60w+UAPiGx8I3p+E8C2BVYOA7Ch88sfVNtRAwmtGxUo/tN
	E1MNljCyfFRmQQWUQ95ZSOcX8RAZOC9me59Zf1msepKxuoT+bFGZ4WCRwiE6cBZX3J1PgMys09s
	P9BjTCbMofKMwswqbpSdfo1lw9xG454NuI9nnBiLUfqA+jfKxgHYNWc3oius0ESucyheeO0wFa+
	XZiu8lxG5bSriuM4wGgafIevCF2og=
X-Received: by 2002:a05:6122:490b:b0:56f:694e:1f10 with SMTP id 71dfb90a1353d-573a55825a5mr1339735e0c.5.1777386193369;
        Tue, 28 Apr 2026 07:23:13 -0700 (PDT)
X-Received: by 2002:a05:6122:490b:b0:56f:694e:1f10 with SMTP id 71dfb90a1353d-573a55825a5mr1339667e0c.5.1777386192845;
        Tue, 28 Apr 2026 07:23:12 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80ba9b8c8sm107072666b.48.2026.04.28.07.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:23:12 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 16:23:06 +0200
Subject: [PATCH 1/9] dt-bindings: mmc: Document support for nvmem-layout
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-block-as-nvmem-v1-1-6ad23e75190a@oss.qualcomm.com>
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
In-Reply-To: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEzNiBTYWx0ZWRfXx2k2M+PoCguA
 gXUypn3NG/0dhCbmMFucBrlfj45LZ74LmhrulD03sqWlM+rWfs5cMsgrjoS5XK0i7lBzKz2Jfzo
 3q5/abk1Zz8OQo3aRpsz9pjmLOmQKKS1csa9PvaWcs6jMDvAEZdzjufp/22yII3Z6rYnEf2sYPA
 +VOgVqmo6vkNHeel4gnC0SXllAA54xn9pcPSM/auIQPcWKjv+aGo0YRBQO0LxK5xonRWU2zQ5e/
 tztIi74sAbfhqtvaky7t+nmMrVhg7j1LCJsMptM29k/H1GxnhkEl+HeWY3ucf0+BwACvz1h/oMt
 40Hr6y/s/rNe4kSXrOd2U/xuuGHQTYC+LgYIOBmT6PKSDPGwloNeCLNCCRmDnxFSxvkyfKsOgKi
 melnyzjyQ91LOrh2aOa6LVX/diXFnhhR7Q7+shOAGgBRr3c1GgZnibzsQB3/faCDHI5kUCFjQvx
 RSulWjQLw/Y8zl6ipbw==
X-Authority-Analysis: v=2.4 cv=Uu5T8ewB c=1 sm=1 tr=0 ts=69f0c2d2 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=hFPe-bIbDLvfECHHD4sA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: 3nzktVKCEgbA2wNoTuCX-OGGW_-3NWwH
X-Proofpoint-GUID: 3nzktVKCEgbA2wNoTuCX-OGGW_-3NWwH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280136
X-Rspamd-Queue-Id: 5C71B48827D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105014-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,0.0.21.24:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.17.48:email];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add support for an nvmem-layout subnode under an eMMC hardware
partition. This allows the partition to be exposed as an NVMEM
provider and its internal layout to be described. For example,
an eMMC boot partition can be used to store device-specific
information such as a WiFi MAC address.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mmc/mmc-card.yaml | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-card.yaml b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
index a61d6c96df759102f9c1fbfd548b026a77921cae..e01fc82ab8520a31196475b18acb5e839e1bf71f 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-card.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
@@ -40,6 +40,9 @@ patternProperties:
         contains:
           const: fixed-partitions
 
+      nvmem-layout:
+        $ref: /schemas/nvmem/layouts/nvmem-layout.yaml
+
 required:
   - compatible
   - reg
@@ -86,6 +89,23 @@ examples:
                     read-only;
                 };
             };
+
+            partitions-boot2 {
+                nvmem-layout {
+                    compatible = "fixed-layout";
+
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    mac-addr@4400 {
+                        reg = <0x4400 0x6>;
+                    };
+
+                    bd-addr@5400 {
+                        reg = <0x5400 0x6>;
+                    };
+                };
+            };
         };
     };
 

-- 
2.34.1


