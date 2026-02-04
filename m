Return-Path: <linux-arm-msm+bounces-91751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ITYGIetgmliYAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 03:23:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 918D9E0C94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 03:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BE038300B9C6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 02:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145422BFC70;
	Wed,  4 Feb 2026 02:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ezdFaQHz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UviWiqUP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3DC2BE02C
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 02:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770171762; cv=none; b=lSlhtgVa/2hm1RGVfVQCy1zNon3KEu/oATY9u+nnNNqBsFLRaNH8HrVLHaZqODKiDzo5pgqeombDkl8m5zIOfrVJgDwMjso/8yIM8sXDVNtERjVkPCbOrKGm642vvWputlvt6kiR8A45Ma426eYPUzFsMOOWx6pUCKVWIyuSkiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770171762; c=relaxed/simple;
	bh=irlBiV/b/NP192hRJFCI1r2sets1NLWq70bQwhzWFM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RHGSo6gk9WIrsmFaa8YLd6/x3pqlFwCbBtz4FJsoSYDmRtD/f8YMVgWRdbNOUzUl8mUgYdl9+DTCBP6em9NQA2+xm7iiAm26wBOPnJhqO/LuEFVSewFAxhj8NENmbyundmFqzB4dxrFn2B9FaSjOv8idN0Lnm/07zWiAgz9Gyco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ezdFaQHz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UviWiqUP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613Im2la2055095
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 02:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ICNqpcLxE033zAPt4Nj4jDjSx1/KBRtm8fVHSukZhYA=; b=ezdFaQHzZu/J54JZ
	AtO+Ge1+KB+PiTFCvkvzD/ZPRIVYYOkPjY3Vghl3thrKz9aRci4cQjpPCofUpXbA
	w7R/aVxa+PHvNWQ7UbIMIQu893HCFzl8GiGh3LnqxeRCCyo/IsPQXAHP41cdU2zd
	H8QZ/SdUjukYrDRr0gGX60njb/fO1mbL8JaSCLR0+A6xD9/oPmJhmWH8Rt1xPZZv
	DqfnPIjGnET4khabf4ztlyA3zcY0lEXGyMj4Nv5MigWrZAyf05BBRnGtLu+upMNf
	opaHCS5tke62SQNSlmSWAHOEBNANzqmPLyF4sKTa49E+cU6CnW23bYYa/szeG5oJ
	bdl50Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3exkb0mv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 02:22:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c337cde7e40so3998618a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 18:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770171759; x=1770776559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICNqpcLxE033zAPt4Nj4jDjSx1/KBRtm8fVHSukZhYA=;
        b=UviWiqUPUAS0yD0Qw3rw4OacsACv2eOhcNyFa51IK4Ci4k0s+RBYKiK8M9vTK5eeAR
         4P82uYlAIkrY+vF1qzaOOj8xhBrz1y7+YmlJi6HqE8CCyr7J2MRm3g1WZlOXlKqa/P+m
         HP40zJsTCzyelHFL9gDUivjTCOr2ct23VcHCfOofHFSyamg5t4fDR22pBikiVaafpfw9
         54no0nzqGn2QvLRuE8pKvfU4l8AH15N5ePcpQX4o1ulG/vCzEO6pSqfzJRYAed1qkUSz
         S5OKl2EI/2vodyYxQaKrz89EjM+d4PfGnKT7VMw0kWTIVIuLt2H6NKRWlJvtGbjxlgfs
         J+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770171759; x=1770776559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ICNqpcLxE033zAPt4Nj4jDjSx1/KBRtm8fVHSukZhYA=;
        b=YQHxaHnm+A06hOZvV+X0jbxSS+BC05OJ69WLCbNlRa/VnV8BQEhuMZC8l6CDwlRGOb
         f0tI1ICpogxyK1zbTzr1IpujgPEsA7RJPGS+eveytajnVY8St/2lhnwHlL7UdbZt1FtH
         KG+dg67Q3cgGahp9lcOhonOgtRBOM5dvNilNH2wCof+rpV79a2I1Se9a5lFbVdVW1ijj
         Xh68LSGqrQlnNhrG/NMXcsVVIb3jib4tM22gTKvPECakXpB82pFcbBYB7rkrJtjDq5GV
         j1/GOYCWCdl4Mu/wDA7J6ryFKOFe1zEN3qFjTOeSdgpDnCXgowQA10+IvZ8hHVtgEsZB
         VHtg==
X-Forwarded-Encrypted: i=1; AJvYcCWCf2KUqyhCdXDoy01GHGOJpy2yqUMhXeNFGQFCfdv5Vd4GyJkZdO+6nq5mhFQkWkn0PShg8ucqcVbLOn68@vger.kernel.org
X-Gm-Message-State: AOJu0YwSOYWsZBMYkrewf3Zc2UKlPGXVE3TueuUY9dZPqXmR+IOOd+Sw
	/JGCLFYvcKM67ktvTxx/6lKESgSUbwiCzWF0BsvTMyWA8FiTQq8hf5HTXxgFr/Vu6/uHhC9jlFV
	dLCdqG5zndMCaROZkKM0CNZBNTT8Hwo4KEDjtkq+C0cyAl1URXG6iHBAzbX5fq6HW/z5Y
X-Gm-Gg: AZuq6aLClmL/E5jmJD5w+MObBpCu7gjUIeNaJWIDuQ5ohLYBVO6ys/u3g0dOsdzUdE2
	uQZXgYJwvm0NWie0hw8RQyGwoWi/mYssjmLCS7DI1H6XQwU/4AL1h1Yam6P1KCjQ4Yl14EFaoGS
	UBpXt4qjFW7sBAduWwqw+biveblAGXDLq947Ch3Btie64MKQLcys8dWcBZHEtcseGy0wzcNDO2g
	WJz9dZ7QlhxRRc38Y6I1+fffI9/tUkvdHlmPbd+lgxhHhHILJB4e4Rg9d66vH8JOpUNNFH2xO0R
	HbeQ7qz6KiS1JZtauZHOIgS8M8l6xM5Ee0xVL/8eGODTu/KjKy87osW3VALXzbLGzZ5nXID8iWl
	qiQHSpfq7FnKJCELrMpdEADVCuBkm9B0wmwv7JBxvtYNKT1Q63SOxQsea4XyWaPNP1fvwQTjg
X-Received: by 2002:a05:6a00:2d28:b0:823:cbb:a484 with SMTP id d2e1a72fcca58-8241c19e012mr1390754b3a.14.1770171759384;
        Tue, 03 Feb 2026 18:22:39 -0800 (PST)
X-Received: by 2002:a05:6a00:2d28:b0:823:cbb:a484 with SMTP id d2e1a72fcca58-8241c19e012mr1390727b3a.14.1770171758853;
        Tue, 03 Feb 2026 18:22:38 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d4a5c28sm695598b3a.62.2026.02.03.18.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 18:22:38 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 04 Feb 2026 10:22:01 +0800
Subject: [PATCH v3 1/3] dt-binding: document QCOM platforms for CTCU device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-enable-ctcu-and-etr-v3-1-0bb95c590ae1@oss.qualcomm.com>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
In-Reply-To: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770171750; l=950;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=irlBiV/b/NP192hRJFCI1r2sets1NLWq70bQwhzWFM4=;
 b=NnwtZjOYQ5gMG56D+5VzvPMXMLVJhfLLL/ORanfhkH66weP50084KFgINw0IwgawYLxYTFH2J
 Kz03pVraxeLCKnDwN3OpzD6dh8ouEooAbRNgFEyndtESHCXLnFbpz2y
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxNCBTYWx0ZWRfX+JI8lAHK4IAs
 9cHceHuutArVkxrn37nuXyIybw+SbUYJPG/zIFb3uCtKHyXmULf15S4G3CcOD9Z2wu3XfB3hOmO
 b3FLGTIvXQr2WpEvxr8eLcbQpKviy0fFD4LTC0k7fYUDjNTnticB8ci+MRgdabw/nV6HTVwZ2Dg
 o4kPwOedpzzZc9VZgcZZv5AdQ2SdTXScLGt1pBxuyQ19JW2JYdAEoJ9z4nZIGDbZrtWHU3gtkRJ
 OoBRYfL8Ch7bOujSIRcSTgHUiz3bWdQRDBeqe/RhtROt7SC6no6R6aNLaP0A8NDxRg5VBVSOBaN
 ophu8qZDzV5zbz+LXQlxPHBoAhNYF/KYnQ9Lr7ocOY9XTbErUdNOOlAehdklEDGi56DISOu6KQW
 EnLdTe+QTBuDJCGADZIQezXBufLsY0r5362FMJuzUqxA3nK0YUM+vCTzB7abHg6J8HCS2Qwtff7
 jmHVJd71ceKk7nJ2jbg==
X-Authority-Analysis: v=2.4 cv=XfOEDY55 c=1 sm=1 tr=0 ts=6982ad70 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=K-gU5Sf5JpjFIvSPVLUA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: cb6uL62dUqvxU5l5zEuz80NnZTuFmv4s
X-Proofpoint-GUID: cb6uL62dUqvxU5l5zEuz80NnZTuFmv4s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040014
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91751-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 918D9E0C94
X-Rspamd-Action: no action

Document the platforms that fallback to using the qcom,sa8775p-ctcu
compatible for probing.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index e002f87361ad..f3f3feac4ce2 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -29,7 +29,11 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,glymur-ctcu
+              - qcom,kaanapali-ctcu
               - qcom,qcs8300-ctcu
+              - qcom,sm8750-ctcu
+              - qcom,x1e80100-ctcu
           - const: qcom,sa8775p-ctcu
       - enum:
           - qcom,sa8775p-ctcu

-- 
2.34.1


