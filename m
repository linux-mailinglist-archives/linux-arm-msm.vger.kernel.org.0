Return-Path: <linux-arm-msm+bounces-105184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFsbL/ni8WlZlAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 12:52:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F8A493301
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 12:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07323304094A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 10:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6614D3E92A0;
	Wed, 29 Apr 2026 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5ZipRlX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cG4e4vzn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1A43EF0DF
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777459934; cv=none; b=gFkBmu6g0LObUet2xU8j+tHW/ijtJ7q+44D2ryixaKPtJ8ZsMmzJ4DVRPtn+FQhgujhHQPWlFTAM6vsJNwDpQMurSrli/ybCAC0HAGBRD0DVUIAZoCwvFc2Yc25GrjdQGKpuLE54tluS/Rq7gAkGQHW013+2ibAFmHcfDy9HMDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777459934; c=relaxed/simple;
	bh=oc0BUGs7hxS62BzdR38BKFZMTtbi6X5LksJcvy7Q96Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kdaj/XbkgrjSQz4oHIJ884G6KHHHioRYdrB8uVIhjzF/4Golry5ySowNv4NVRH6A6gXbDVfqnpkBJ7OlEO2iQNse1qN0iRwrG2/yQy2yb9dH8MT8pNqaQoynKJCBx1Hz+2Vzzkr9JaZa2HDwgDq35DL8+PLEna/AYHR37f3Opng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5ZipRlX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cG4e4vzn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q7ji1721242
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U7L4L1oR9Ld6c0Aq902NuNggR2GtSSCW13PbHPuvGbI=; b=o5ZipRlX27n56NGC
	DVsDVd6fOKpSkNvWWuJ7eHNaCFX34RFJhjGjYCqRMReuBnGo1CPC9H2MF0KBN/aZ
	JaIeuSLvhmmXlkOTenPBcPHmSJknxFQmGpyoupI1bK8lwEuPCLV+TNBga4u/pieG
	S56BUHGfS7DE2xhUKfPdvN18vnByQX/XovjsYcyY3Yx4RC3ga9bBDwvOYKQ6qyNf
	VoSy+7mosFI6ZrmdBJ2mcYPcD8T/WvxMpghgAAIKCY7HzwnymeDwzSqK3a9I3dkg
	OD6kiHY1vTpVoQX+O/Ocm9NoeDGyJVntjVFd54keW6lzmthEd7Lt9AN+YseP7xLT
	Srezfg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua731phs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:52:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2e91add2aso25497705ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 03:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777459930; x=1778064730; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7L4L1oR9Ld6c0Aq902NuNggR2GtSSCW13PbHPuvGbI=;
        b=cG4e4vzniMcrxjx4N6f5owOAqodrvehembO/4JHjIjmsguG12hEhrQHxdxO9xWud4D
         Yz7in4UeY1sO/9896Z4YVYlrMGd86KIjYWPoUl9h3CfuU+S40LoldcsDB/5eCU4uo1zn
         y+egCyGaJyKfFDspD6BJHCGBRxT4i8cqUPvsw2uH7BXy79ZxZdzFf46hPzSMCDaNBB3o
         mj09zbSVAuRA9eTaigv4dfGK6MhFyjcL3YGGSHDmSwV+Po25Q/Ru+XVxHEqqRe/i1Dgw
         47c+fKokR1JNKT+WVrGHyi4dTpiOEtyIAyz3978S9GkNbwGTRuOObW4U/keMYQza0GFh
         c21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777459930; x=1778064730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U7L4L1oR9Ld6c0Aq902NuNggR2GtSSCW13PbHPuvGbI=;
        b=dpE68knX6XJG/MHSzIJ1+2vtcwdt8/Spq4Bnc3AwsnrfKv85ymR9rtMCEKVyjdqGsN
         VWAzJB+6p1oY4f4aK7to1Lc4tzYDmBkt8O381uwKxv/tc4nxwhsb974nlzbPmZMHu7u2
         FMFPVM9J/nnLtu+rLGjg4IwTjyFwfZh7bSzBPXYBFdIS7uuC8mz2oXD6JHirEUUZhlNh
         iuiBqrl9/LMkrv74QCGL2HOx02BlXEKhFXzxpNgmEQUPp1lYGbXCpuA3UoOn/GzHmUSY
         OtMFY4s0QhwqjJ2S198Ymn3tkw4lOW7pq/kudjVckIDE7kmV84mBSTsYOSg7lg6ZzVDy
         jcgA==
X-Forwarded-Encrypted: i=1; AFNElJ+Kv4LIHgZNO199pVHAF4VsOZJNkWCgx8UQsoB7q8Wnbp12tN+ADO9QDqIi1Asr6qCWJODTV9NfOGs9HZg/@vger.kernel.org
X-Gm-Message-State: AOJu0YzlXyXcnFLh1AsetH/iNhbZbJLVM9sKAMMkOeTYR68vp6koGewT
	nMu0OccmFZ7iK4p33O1NfVWsN1EFTwpEggAhUubNgNdjXveT8/nwV+m7ApACTQXoym0RMQvRANl
	auWHQKhmlLI/L9vWOWX0JkNK2PWsY70KnE0U6QRuoSRsLMFct3j0ie9vsZCkhOXCgtzap
X-Gm-Gg: AeBDietWN/8e693aWA2H82TXg2Gja5fCbwFjNmsutcn1RQZA21hkeNeXXWKxjMMeHNh
	WJ9nB5QvcoOnxgEX72fw7Zm+3GJye+GkTgHYnfbmyKdf1dZ7DYfUuyzuMLrTkRDZQKlyCHQ9rgf
	JEIOpuSvPsIsxu9JtWqHA9aGtLqFHP1afSWCME9o4/7yBx8tEbSRli0YNV8vrrps2hgg21WA/UX
	WK+QgLW9dqYrlCIR3rg3ML+DMP6cb50pMAwXbdsH8XQNl/+3PEEK4UcraMANvjwGOaWGFTz6klQ
	FeVtdUk6xJVilKIADRCLNNWO92+gqz4tgVsDyTQ6NJpjwXH2l25JCLpWFcHfQE3TY7qK5EnDZsO
	XagUIrQ+kr5vayy369ZIKfNYgOxR/CK8RrX5eGm853ceyoJsJIDL2SHcHGwpTXWk=
X-Received: by 2002:a17:902:7b8e:b0:2b0:9c2b:641d with SMTP id d9443c01a7336-2b98730cb97mr21791855ad.2.1777459930284;
        Wed, 29 Apr 2026 03:52:10 -0700 (PDT)
X-Received: by 2002:a17:902:7b8e:b0:2b0:9c2b:641d with SMTP id d9443c01a7336-2b98730cb97mr21791725ad.2.1777459929820;
        Wed, 29 Apr 2026 03:52:09 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988772e9csm18316715ad.9.2026.04.29.03.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 03:52:09 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 16:21:49 +0530
Subject: [PATCH 1/5] dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra
 SoC RPMCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-shikra-gcc-rpmcc-clks-v1-1-c3cd77558b7a@oss.qualcomm.com>
References: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
In-Reply-To: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f1e2da cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=5MG6tTDo7b5tcJehnegA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEwOSBTYWx0ZWRfX7TWXZfDqICdi
 eIUmWgntlQIXgclGGX8WJh85PomxT+/v9lI7UpSUZXbsohXLn+XWTT/wmXMzLd++LPZs2VWm9Wz
 QZcmN6Mtdz1qL6/tbRG5uzWS6sQTugAxQKItrNVt0JdNGwv/ekZeKJfI6lfjUTPNpx+WfjaGzus
 mqlVGe06L1ycObqepg6de/jQe2gJx8JjQsV5H5uS8eIckvSi9tFLr5bVqL6qqUWdIXosc+4qYmD
 iesfD4iVatrjd+DCeK39WyyP16ojvkXuou48k9UBUHkRwRNkVRzuWcWgjUHDWs+B75HZSePZNYm
 GlTasQxYaDE6QAnfgatjUpOmqz7jF2wq9wvJ2unmhdUAR6cMoJMSodrrTlm1AkCDzibk4rgFid3
 NDKhlVJYiO19BN9+g0wH9mHmTofQFdEsi9Ene1vWXB9Scx0iws9tsasMt/25wMEFxD6tYNY5j2+
 aOMkI5XC4zBUt8+K2AA==
X-Proofpoint-GUID: _pUyO7aHAWuJVnaKrsG2aUIqkV_LHuXw
X-Proofpoint-ORIG-GUID: _pUyO7aHAWuJVnaKrsG2aUIqkV_LHuXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290109
X-Rspamd-Queue-Id: 62F8A493301
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105184-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add bindings documentation for RPM clock controller on Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index ab97d4b7dba8bc8d38903b399d2bd4bda087db8a..b8aea98b00bc22c4ab6da1e6235ad676f200b44e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -46,6 +46,7 @@ properties:
           - qcom,rpmcc-qcs404
           - qcom,rpmcc-sdm429
           - qcom,rpmcc-sdm660
+          - qcom,rpmcc-shikra
           - qcom,rpmcc-sm6115
           - qcom,rpmcc-sm6125
           - qcom,rpmcc-sm6375
@@ -126,6 +127,7 @@ allOf:
               - qcom,rpmcc-qcs404
               - qcom,rpmcc-sdm429
               - qcom,rpmcc-sdm660
+              - qcom,rpmcc-shikra
               - qcom,rpmcc-sm6115
               - qcom,rpmcc-sm6125
 

-- 
2.34.1


