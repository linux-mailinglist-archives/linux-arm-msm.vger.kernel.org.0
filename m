Return-Path: <linux-arm-msm+bounces-108382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ae0BzkRDGr6VQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:28:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0376579183
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6443D3067FAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8023D4137;
	Tue, 19 May 2026 07:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PIVqtZic";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WIm8oqoW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EC03D3D05
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175474; cv=none; b=Z0E+rch4FRVYgN6kOja356MjlpET64CJth04AUaN9JJ0AyUxsSd/x/y5BvMjri7ulxQa0CE5ZYet+Y9rvEoMBmXBDJ41qRw27u0gCYOi1TQtFC0eFG8BjSKzt4o7CmNVOj+RJw9n0i9G5a8rCU+ZWN9m1iZET87xwig9/Ixq0rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175474; c=relaxed/simple;
	bh=zUZR7DaV9Z1gqckkghR4I+LB/NET6dfTlAYiLQbReIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hGpbp1TmAAgKcBm1VVD/2pQIIiyWOtV9rvSo1h3xsNOl3VFH/xmyb2MXcwcUUet8lGciKvgPv73+KhOFlnmvuElKfsTDPFuhAGV7PNt7NUaWpzmivRpqE1gTqLG0vf7H4JezUUsCcNTOXc+IT4ug8RJDjjfVx0/HkHJNp4T4Dww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PIVqtZic; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WIm8oqoW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J59n1S1251662
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KgZbprcQ0e6itNT2rwaK3othW4Yy4NP2EPKOBD18VBc=; b=PIVqtZicrFvCthW5
	l4kC8+sj00JQbPYOP5F0O7E09q5yr9gJ3id5qVUMv/Mf8RKB1UL2yDdSQnUAsPak
	Zy29MOJdNUiki+k5PrvfgMIOB/W2VMNGpmRd43TF39lPM76tU51bI6IeT9vF3aLt
	qvuNgDiNKICYAbAvDkc3LaFRkx/l3wABAY18daV/DofIqmRq+SBxj45D0SfKdjGV
	WWxGdQOQAT5PE00h4grycHSeJas1zFla04NmPTlqxwmxan06m39OAtcI6KwLdkXS
	mosv8U2CFwG1JCgXLmaqfJlzh2QoP+DJsGyAeurUSb/GQNt4yCobOiFij9bMeWrW
	16qCHg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82c0kybu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:24:31 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1353a6f29deso3710296c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 00:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779175471; x=1779780271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KgZbprcQ0e6itNT2rwaK3othW4Yy4NP2EPKOBD18VBc=;
        b=WIm8oqoWoVEZu3R1BSlOKsyinIgN24CBlAJKOnnbr+DB5/y+mOHFzT1+ye9HfiIXtV
         ceS5+2x7yAsn8qvQcpVuihGAwTqSA6VtrOsCa6Hh901UFUzuYM7owTUrUnyNPYuCvb8V
         gakhB+czWwfqW6g8FGsGyd2UWdNEOW3leqRKPBsRi8El5qvSn8RcI+BMQF8Cm1p9O4oN
         8Rx8tXLdbHeMbj9ZRdazF1Fv/UIk9VHbKoRdlC62IWP78EB2OvxpCl5GJtEroBuSHhav
         xjMWmpu4CFMEDOz3/cArZHMPG1hGfEcBAWjsM6kNH38uzMYxGZflJV9KLL3Z2UUB2ryU
         wnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175471; x=1779780271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KgZbprcQ0e6itNT2rwaK3othW4Yy4NP2EPKOBD18VBc=;
        b=q/IsXMU/R2g1T6vhkXY5PAwaL3pr81bVrD4IXz/f+jQ7Em2CyertRImmX2BPRv4Us4
         6xPrp/kn0XYzeEjTMCPuDQh46LY3y/hzO4ulF5LZPIhug0K0uRRUEL6wtYRefPSv1Ht6
         bZBu8IxngDiVxk8wySsL04ernbpLy8BZKAii5CafCFD3hhoETLzAtjT5P3FCoGBX5fzL
         xJTsdmGpssrl3p5d/5AUDm2LC5L8hT+18ZAodM0dkl8crGhV8jl9I7RwYNn3uM1pDRHj
         NTcgBgjk6v1YEDQkDJ+1+9qdiURKAi2vjh2auTux5y9LnSOAyNdp/dOCO4nEcKKDAjH3
         bkHA==
X-Forwarded-Encrypted: i=1; AFNElJ+d5XhFB6yc7VgCY1SyHfuzd09P1a/04QllL7j2oB42EEcsDd9pd8hi35DE40Z/gZV+CDSEmTGrgHXcYowq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2BZlSSKWgrRl3dYWbMNcx8vEgCx86DB1CCAHm6X3nsz2GMYBF
	iBukRqzDav5Zr2IT7/RumT5vXh/LABibhVQOX3CAfkS2PXrUKzP370SEBSiKC2J9tcQMw496vlU
	F31CV5X5UypZZQ/Uu8mjOD7HQNVX3ZfheRl2lt45RFIzquVjJhE7vx9p5CMYO4lP2wHJl
X-Gm-Gg: Acq92OG1+RXRvhMF9q3BNfny2feYpMwQ7+IQwWiu2ZrXufHaLew23ga+e00TVUPJGr1
	fg1veAnmirkId3k7LrnzKYUlRy14c21kiIziu3n5KgTkhKX+Y53aFp1IS7zEmCdPF6s3XDRcvSS
	fqMh+oGgnRNVYRdHTzaZcXM3jaOQZqWpfsuqbwexV4qn7m4qjuuJuVMNlcAdHowV6f1jC7FcYNh
	knHqx9wHnJKrJTs5klvd2ibQ9NX4s0Pbql/DKPkNR9wBx7QviGcXZgxNjW+CJYqzuShklh2AZdy
	wPtnk50RYevi1pyOZzH9hGv2pcOFB8VH3wff0PeS+2eTDQr8Ns5s27LSfgf+ZWlRUUlstscDbOd
	pwRMmhl3rtPLJzE7gFMGsIf7nHzm2idDcQwwvlzh55gUlKU7Crdc2+83jtVZiZzpqVbfdvrFx
X-Received: by 2002:a05:7022:40d:b0:12d:de3e:cc02 with SMTP id a92af1059eb24-13504a53ff1mr8182735c88.41.1779175470725;
        Tue, 19 May 2026 00:24:30 -0700 (PDT)
X-Received: by 2002:a05:7022:40d:b0:12d:de3e:cc02 with SMTP id a92af1059eb24-13504a53ff1mr8182706c88.41.1779175470216;
        Tue, 19 May 2026 00:24:30 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm23337779c88.7.2026.05.19.00.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:24:29 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 19 May 2026 00:24:22 -0700
Subject: [PATCH v6 4/6] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Hawi SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-knp-soccp-v6-4-cf5d0e194b5f@oss.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
In-Reply-To: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, shengchao.guo@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779175464; l=967;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Z9lh+zI7bk0b+Sujah/Bvi+pWI96/tEBHS7dOgWjLWE=;
 b=q2LKoAAiPBX7FjVBywQROb2+56qKeN7S5lgvFQg41VeThz/67DPW9oOPB0J1UWkdIfNCjPk62
 AskkSQXXmi+DMaTkY5wp9b8LU+zNVkaI+p6bmyVlS/nkYNsIIhA5u3w
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MSBTYWx0ZWRfX0W/HlzdgUF2a
 rdtOBYVyU/NVvJS2P+N6XfTMy9bwIx4o9d90Buz6qeh8p8r0CxwOig91kWLs8REF+1LRWFqohAu
 1lllb3wQzBFB+xE65a6fTweu0AGGhcIIbZrRiXs0yVTIztW9f0uAhVoYf6zeJnUYOUPTXWACtxW
 XlNtZgIc6Eik2C6/hPlRUHOD2tyJmyGgMbabpV/h4TAFFZjp1GmIakiJoAKpjpg5ddALvVtf5rN
 rISk501dTWTt2j/TSnbq9Gpej37L0tAwimSy5LnsEl/AvZxMBBiebzHPC3eif+8W7CygPRZL12J
 8x9iHtBdrL3AbMj32Y8ElIscbOm6+8P7g8tT8cDz3I+33EBlyclT6BVVNrx2IHsyTRZTz9VsTmY
 FJhBEkb9XW+wQEiDczim9rWVf0bKV5VEIJwd+6EvKFL1znh2XxQ2tmln+Nwi033y8ONYrbXcPdv
 J3fp8GNs0TfYBnUnI/w==
X-Authority-Analysis: v=2.4 cv=A5Jc+aWG c=1 sm=1 tr=0 ts=6a0c102f cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hXvcgRDSK2Dw3lFIK20A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: IiGdVmJJaDW5bYW9Dbsg7IOyz8ta1Zrp
X-Proofpoint-ORIG-GUID: IiGdVmJJaDW5bYW9Dbsg7IOyz8ta1Zrp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108382-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D0376579183
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Document SoCCP remote processor used on Hawi SoC which is fully
compatible with Kaanapali.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
index ce18460a949f..d3b525ff2f5f 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
@@ -21,6 +21,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-soccp-pas
+              - qcom,hawi-soccp-pas
           - const: qcom,kaanapali-soccp-pas
       - enum:
           - qcom,kaanapali-soccp-pas

-- 
2.34.1


