Return-Path: <linux-arm-msm+bounces-116086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /VCnOSapRmrwbAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:08:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CA86FBDC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:08:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fsGJ454y;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Bi0O7tbT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116086-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116086-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8EBAE30F0567
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 17:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D03346FA1;
	Thu,  2 Jul 2026 17:09:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F66D340408
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 17:09:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783012168; cv=none; b=igqsOYhITrOx1rV5XyXHm56Dryozh/kMGfqbA8D8NXB/QC2HGzzTYdFnGvZ/UwLzjRlbP20IlLNfQ1FcnZWorEoAIB8D6Js31sVjpiq6CQyuW9+5T2WUwnLMtLqdHK1SrPBhF5SRAcKDtGmTtcUVFHHn7c5c+Fh8v/TBoFSH+4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783012168; c=relaxed/simple;
	bh=cKqwClXNxU7u+xSUDBQ9Brn00QjM1FW6vPXxe9i3ims=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k/GMK7MfHVGL2vLBgPYObuSdc8PlHmIrvsc3dHZG5NxOpLZU1WbcKbAv8fPdY5YKPdMF7oMeIKLE9+Q0ct8lDXItxufScIWq9cZFpAVsYdLTRmUQj9JEJ0F3xay6zolpDWrkS7LKYWqNp1rZZ2GEgMD2USuX0LTr54RdXYUyjuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsGJ454y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bi0O7tbT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3FYo622455
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 17:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CsRqF/VVe9Ur+OBuk+UfrGRhTIFOLaL6m6mXFREYy5c=; b=fsGJ454yyr1xZktf
	h/a+dcSLDwpl7VwHIpnJfuSWOP0RLAvmnHZWhXwe6YchsWf0YGXZ5wi/+drJ8tqy
	Y/ZalibyX3TWpXPsR/HfrYeMogmuiTCoXd6q/9tTN49+SKodf/KBk0b53ojes7qZ
	X1jb3VK/z8zljLQXnF+T5Msg7wf0jyvhVeP4L8tKcLMAlZVjhnMC6UTpWXG3DNxk
	YtmMvgP/WC+w0QGvuyuxeAqFnWjt4tifMfI3OjJgVr3DIFqjztCu8BZRG3nCInG+
	ZrX52Dmwk7OtzZz7znW4AThMYIjH5RmCx28BJCHQSuJ/sWKf3TKxMsUoirx/ii9l
	Ka6QZw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s250ym3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 17:09:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-380f3670853so179909a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783012165; x=1783616965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CsRqF/VVe9Ur+OBuk+UfrGRhTIFOLaL6m6mXFREYy5c=;
        b=Bi0O7tbTiRgvxZ7FjHhlZLfhX0aapbzirsFUqEaBqAi5kXxjIfl4yWTZTkhzkTYUSN
         MpOuS2Ao+8/w7OMVfNLR6aYxmCOus6TDL8mX6KYLHWN6FcQcFGlKix2FO0yd/hwUG0JP
         SJhibf+albM0XTUhcOgSMoGc59NDcBYnLiCToNGqO83+MprSiD3vbcVc4KUX9LyeqAMh
         8FBMWd166x3utkHRwAiHlcv8p7Zlv50RbiXHuAPSJ9LV5RQEONwpaYKQ2u3oshkKRfZD
         N579SyMcPCAHjDSxb/UegKnLNAhSyFgO+2dxS1oe3z29/J2eEKe0c3UddWdnyaT5U5FR
         aoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783012165; x=1783616965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CsRqF/VVe9Ur+OBuk+UfrGRhTIFOLaL6m6mXFREYy5c=;
        b=PmECV9TXBaloEaaqNiA+keLltMwKDYVj8Cc2w+CNPnzfY1EWUdHlL4FwrGynn6u9A5
         pwFMzryHvwmbXb7Qgz0+8UEyS1qsluIL6EMBaM0jt+2aW86wPVpDG9L6FyvqjiwY4v9t
         Hm2UHGbrA7KgqPvDTs9A/QcZW+JVsdNZBMTdDxzKfqxB2GBdbKCfUIJcnVUDRW/G0Li/
         yJbDNbEfyySeX3ybhwmi4xhT3rlq3uv0/AtdBPqfEtEPRAUeNjEKyk+LDSfnkKIv01xw
         Mn9ZdB4+58o7UEY/WO0ChgMX4dwKqiqW6KPFtiQONGHieQN8BSHaHfEMip+vuONNzrDq
         dn+A==
X-Gm-Message-State: AOJu0YxeIXCJkeuAWjn7Ozrr2WzIAyqPf6/wIWwPywdF0rzqoLNLljGK
	2KsvtbThLOAp8M2GWwI62MBSyfwSFAw+/zGxivsbpglOU5CyXlmEMsxMHwGgJQlzqKCTscO1pR1
	7LlgoYCcDvYaPxwA56C+7jR9YP39rXkDTBiVp0TCQsMfvaEuGzWB7vtTxi7jeFqZcJIiQlZvRfp
	oa
X-Gm-Gg: AfdE7ckzrlG3HVLGGlAqXDrPNYoBblFn4F/iIiIWPRUTx6GHsu5OzPnLyAg6epb2H5J
	f7Vcl15Soc7YANvEwxv1Pr5WwWd5ev/VX9krTABhXwPh4sEUCwY9hTLiJT2iZwWQIJ/Adk/RhSO
	8bF1w3o4zz9C9iIxEiItdq64viom8wwxOT4xRvJ3xxPpUtgnENPnnnlH8ev6evKCXEZOO89UcE3
	RjdC34Pp9YjccTlbbg33h/qh2Vqd+nqwPhBm7HgUbYmPEoWKqTwneXwsiEGwVNMiLp2jkYTW+gb
	f9B7AcK+lDHdxAl446YUKZbOjIgHno5Zhzx1h9sALeoMuKWmNGGBGZJY90GNaKJRZnCqdbePzec
	6cL+uma+nyVi2mpYBc+CmBfuMq4KEkU7VO4nCFwmAf5kvNuKTVHGc4lEihGI=
X-Received: by 2002:a17:90b:1649:b0:380:83bc:84de with SMTP id 98e67ed59e1d1-380aa1bebccmr4331877a91.6.1783012165418;
        Thu, 02 Jul 2026 10:09:25 -0700 (PDT)
X-Received: by 2002:a17:90b:1649:b0:380:83bc:84de with SMTP id 98e67ed59e1d1-380aa1bebccmr4331855a91.6.1783012164980;
        Thu, 02 Jul 2026 10:09:24 -0700 (PDT)
Received: from hu-linzl-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb80f5csm16505031eec.15.2026.07.02.10.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:09:24 -0700 (PDT)
From: Lin Li <zhuolin.li@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 10:08:07 -0700
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add Hawi video clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-hawi-videocc-v1-1-6c1e640b0954@oss.qualcomm.com>
References: <20260702-hawi-videocc-v1-0-6c1e640b0954@oss.qualcomm.com>
In-Reply-To: <20260702-hawi-videocc-v1-0-6c1e640b0954@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lin Li <zhuolin.li@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783012163; l=3926;
 i=zhuolin.li@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=cKqwClXNxU7u+xSUDBQ9Brn00QjM1FW6vPXxe9i3ims=;
 b=pmnf/yHxl+D4DXqlIRJCzVN03uie8l7XViEY1AiJkBCR3PX8fQUDNZnFXdpdtXYVtfFfWx15b
 IBUQEevyoKKCCOQkvXSwlCjdsF9dF5gWxsmBLGZxYb/HCUNkunolJme
X-Developer-Key: i=zhuolin.li@oss.qualcomm.com; a=ed25519;
 pk=MHXg6mCJoooUzb0vMzMIbkL59skKuD2BVgAX/XneLrU=
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a469b46 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Es2KtYj6OvgIQp6ayCIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: MYcNjmgWua6i5-jguxcGbTsLvo-ibtTW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE4MCBTYWx0ZWRfX6z1bSvuDCkBl
 sjhLZvVc4YMJZjVtUYoeKRV7PFNjyGX/vMMoXbMHNfhsbRtWw2ePPVTSmQjLflQboANKQ+yZz29
 Tst79/qcX1tg/kz8aVU3JOCdix1FozkyHqKQqMfGaHgCKekvM4nSO010zKA2K8us0nVVWHhomru
 VD8MEngAMezs9NZxQCagGqeJhu0x0vEwa1RaKZDQcGjPZU4C/UzS5xS16tDwI5Y5XjyZwHDZnVd
 mOl8oj4Ut7bqQ7plMzFD0wLMA4WlJO/yFF09B79v7nRbHd99jCyI1SNPz1WGQQQps8eaMB7e9AP
 Gb5OMwT50JOT1sHWxMVjZbFVFQARJB8l9p0zyCPKpUzogE0gfsRA9oVYA8N8vvPMVOI/XRxNZNr
 GaTT+rzebpdQjJQX2NrxjLLQThzh4JufmuSiaWhPvuYCFtgBWH70dkdJC7R5GtXNE67aMyPbprV
 eFJCUvAjiFOP3mxqCyA==
X-Proofpoint-GUID: MYcNjmgWua6i5-jguxcGbTsLvo-ibtTW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE4MCBTYWx0ZWRfX6onVO3jLP1PE
 8/bzkdM/AYw0XOWHfat/qNYFcxzbfnxg/bQZXj1aWivxzlnI7dGcud0agJizgh7j3Aqfj4sm23K
 CUXQOubq6rrcIwgfXvmrEI/fQykm0zw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020180
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116086-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:quic_jkona@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:zhuolin.li@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[zhuolin.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhuolin.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 30CA86FBDC6

Add device tree bindings for the video clock controller on Qualcomm
Hawi SoC.

Signed-off-by: Lin Li <zhuolin.li@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 +
 include/dt-bindings/clock/qcom,hawi-videocc.h      | 64 ++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 5d77029bfaf8..a6fd1992d6d2 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -16,6 +16,7 @@ description: |
 
   See also:
     include/dt-bindings/clock/qcom,glymur-videocc.h
+    include/dt-bindings/clock/qcom,hawi-videocc.h
     include/dt-bindings/clock/qcom,kaanapali-videocc.h
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
@@ -26,6 +27,7 @@ properties:
   compatible:
     enum:
       - qcom,glymur-videocc
+      - qcom,hawi-videocc
       - qcom,kaanapali-videocc
       - qcom,sm8450-videocc
       - qcom,sm8475-videocc
@@ -68,6 +70,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-videocc
+              - qcom,hawi-videocc
               - qcom,kaanapali-videocc
               - qcom,sm8450-videocc
               - qcom,sm8550-videocc
diff --git a/include/dt-bindings/clock/qcom,hawi-videocc.h b/include/dt-bindings/clock/qcom,hawi-videocc.h
new file mode 100644
index 000000000000..8c97079ff1a7
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,hawi-videocc.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_HAWI_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_HAWI_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_CX_AXI0_CLK					2
+#define VIDEO_CC_CX_DBGCH_XO_CLK				3
+#define VIDEO_CC_CX_XO_CLK					4
+#define VIDEO_CC_DBGCH_XO_CLK					5
+#define VIDEO_CC_MVS0_CLK					6
+#define VIDEO_CC_MVS0_CLK_SRC					7
+#define VIDEO_CC_MVS0_SHIFT_CLK					8
+#define VIDEO_CC_MVS0_VPP0_CLK					9
+#define VIDEO_CC_MVS0_VPP0_VPP1_GATING_CLK			10
+#define VIDEO_CC_MVS0_VPP1_CLK					11
+#define VIDEO_CC_MVS0A_CLK					12
+#define VIDEO_CC_MVS0A_CLK_SRC					13
+#define VIDEO_CC_MVS0B_CLK					14
+#define VIDEO_CC_MVS0B_CLK_SRC					15
+#define VIDEO_CC_MVS0C_CLK					16
+#define VIDEO_CC_MVS0C_CLK_SRC					17
+#define VIDEO_CC_MVS0C_CTL_FREERUN_CLK				18
+#define VIDEO_CC_MVS0C_DEBUG_CLK				19
+#define VIDEO_CC_MVS0C_FREERUN_CLK				20
+#define VIDEO_CC_MVS0C_SHIFT_CLK				21
+#define VIDEO_CC_PLL0						22
+#define VIDEO_CC_PLL0_OUT_EVEN					23
+#define VIDEO_CC_PLL1						24
+#define VIDEO_CC_PLL2						25
+#define VIDEO_CC_PLL3						26
+#define VIDEO_CC_SLEEP_CLK					27
+#define VIDEO_CC_XO_CLK						28
+#define VIDEO_CC_XO_CLK_SRC					29
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_AXI0_CX_INT_GDSC				0
+#define VIDEO_CC_MM_INT_GDSC					1
+#define VIDEO_CC_MVS0_GDSC					2
+#define VIDEO_CC_MVS0_VPP0_GDSC					3
+#define VIDEO_CC_MVS0_VPP1_GDSC					4
+#define VIDEO_CC_MVS0A_GDSC					5
+#define VIDEO_CC_MVS0C_GDSC					6
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_AXI0_CX_INT_BCR				0
+#define VIDEO_CC_INTERFACE_BCR					1
+#define VIDEO_CC_MM_INT_BCR					2
+#define VIDEO_CC_MVS0_BCR					3
+#define VIDEO_CC_MVS0_VPP0_BCR					4
+#define VIDEO_CC_MVS0_VPP1_BCR					5
+#define VIDEO_CC_MVS0A_BCR					6
+#define VIDEO_CC_MVS0C_CLK_ARES					7
+#define VIDEO_CC_MVS0C_BCR					8
+#define VIDEO_CC_MVS0C_CTL_FREERUN_CLK_ARES			9
+#define VIDEO_CC_MVS0C_FREERUN_CLK_ARES				10
+#define VIDEO_CC_XO_CLK_ARES					11
+
+#endif

-- 
2.34.1


