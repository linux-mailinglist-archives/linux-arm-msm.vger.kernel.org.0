Return-Path: <linux-arm-msm+bounces-115825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qmd9GNcBRmoQHwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 08:14:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C306F3B74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 08:14:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EEtvmRRa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="P5/e44vo";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115825-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115825-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 057CC30BB11B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 06:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD24375AC3;
	Thu,  2 Jul 2026 06:08:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ABD374E4C
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 06:08:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782972532; cv=none; b=SCJHEV7yK5lpwWW3H0PptanzEdL9c/Tqn95K4h8gY6Or3r1v+opEOzBJjkCiwnZkmo/8G/jN6psKmtLJ9CbwRZ2PBenQp/ZCVtdgCC/7oNPqklU38fQY7FIgsk6zgeMBxEtS5GGwggBZ3CnD4JwVjSeDgnvzDCUGPhxez73E57c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782972532; c=relaxed/simple;
	bh=YWgBvXVXF70bptWYE1RikhsP4a8CbIlb6SjMxl7HeAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uq39qums01gvGjrKP8aKqAeld/c8Q6G1/NCh7m8j7xOoo+xscJNVeWlPLDvOs5WpzJ54JS0ckd4ldwacTO26xxezDwnd4l++S374vT2nfSCuR79Gsytvm8HUlD/YjkCfVnlkMgJsoZnfxTQ/Ty8SidNZoDlWhb2/uoXgCy0o9ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EEtvmRRa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P5/e44vo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KHei2959650
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 06:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hcgaK1dgPNDQoQ2Qef50ug40L7J06HDgu6Mo/n3XcK8=; b=EEtvmRRaK0kWVQL8
	wv5z/u9NO1LzFb/wLEM3JLGhMOEdhy3ZSO+hHhbgT1xuI0RmU/GS+SM/E96TH45t
	03P4MQfL6mLH7CqqQeH6zSNIBq0LPBaJptKwkPi/pCAFAGeHiCxeOktnA1Lp4JVE
	4bC7P0mLIk0hKzUBZ8AxTWY3OPrpqHJ68NlUusEqmG2xura1QwKUx1Ua3+2Y5I+r
	0PHgP1MNJbOYcGSb7A7xsBZ6l/uubrf/RysfE7Z28o57X3OCd8NDvw3rXwbFI53P
	cgF4V4/vYQaJM+h1eTMOCSi5m00oET5h8clQvshlfV14kkxZo47sBsXcBNQI9dc8
	Y37N8A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f563mjq4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 06:08:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c804e38c65so29040795ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 23:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782972529; x=1783577329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hcgaK1dgPNDQoQ2Qef50ug40L7J06HDgu6Mo/n3XcK8=;
        b=P5/e44voUo+E0ViCw91Ba++Y0I5MNv+wR1Gh6K45/M7i/HHx/UNQU/1TYAeNzcs7fR
         VLW2qPk0g4l3O51r+9jPbPvb2IJJ132iGsBrox4RNkox/lq+x4Nn5jHp22YLt4DI7EXG
         zjYSaj2cuIR6pPItuceZKL4ov4kLgQZKOj7C/Pltmhlv7rFsbihPRvqDjT9frZq5CBNo
         Z6I7Sj7BJJa+TMOji2W7xEUVRVSoPjWtGbIHzPEUidlpN5PxfD5e3aF19TMyOIX8nrdu
         6yHeogpkT2kq5EDmFhmyZQ5Eo0PykLzZKo1FME0gtBgVhAOAxIGzdRtXdqKUuWO4XMkI
         logg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782972529; x=1783577329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hcgaK1dgPNDQoQ2Qef50ug40L7J06HDgu6Mo/n3XcK8=;
        b=ewq0p3/8ri6EPee/kLgEfF9zGu+H2y3wi+hLRyctzOuyjbkpzXo07/3zcLCnwOeWiL
         /4t0Ph2/fffBNEWbhP0evge+l7jVtFAyBw4WqkI73hk7HqZ4gsO3PY07gRNvPNjE/XZW
         AhGyhUBMC7T5apR7TQGsQyBl/2os8cNO8sqHzEk1u+r46UHKk2jlL0C1z+RnAF859FRV
         dIA8Jwd24inLdj9OU16XE4tACp3KhOdOFDfJO2cjbZlEC8cmG4sLPuLfhpe5ROzJLcEl
         Vay21J5QobmU3wxM2KFtC6Qr9JpXTjJ5zBg2nJph/K7Y+xTRSW8HtxOCp3CLtgCp22+K
         uTQw==
X-Forwarded-Encrypted: i=1; AHgh+RqecZJUYeeDi87sRE4/fMpahPEOvv3bavY4sKPzMQnW5KSl13aTq1Y96IU5WgORN6L36igWfhMYJmngUccu@vger.kernel.org
X-Gm-Message-State: AOJu0YyrvYcxRl1QXBlpT+bkcl6MDLOv+QabYqQjxIGwhxp5gK5Qbk0Z
	lnyRruSltXfEKtaBJzmMudRQlNWA6i5Ho/Ux3UlSGfIkIRJ/nLjtbu0Vuha4fWdFk7Y8WYbRFXn
	2iRoKGasJQtnmiPzWHrs7WM5LOy2te5Yfm6YSznfFbwSjlqhjPKHcBFB9Z/v8PhHt6EAV
X-Gm-Gg: AfdE7clhhAeYjqkc9LbtXig9NjJ+LqGUuq7/fkE6KhQjlfB+T2q2MjMohuRKUtmdDgR
	HNmTGkAYRpvRJpQIKiyuNKEWMw7rI89J+uS/HlyhqhG/i9Ci0YoaiSx1TzQKqoDhdCyBTG2Rkvf
	pxzctMcdJwU66DRC1taUmqi2iZ/bzk8HTWAS0IvtoXJXwnUX2AsZZ75RqqZP1H52+kcZ2AS2PHz
	SxBE+CbmxfxbZYbWu2fAGbdPdrDZYaFoFe1IV8BosyvpbyxdXJcv4xVsVkR8kIUuXB35VYoEfsC
	U/HVd4qbiFEy7aSNQBUoZtZofOZv5dRLDPdZpw+XWdcTukeqyW4a/6GEIi2da/RYN3tCdKSf09Y
	boBC6xays26OWK1Cw/RZl8Q5cux17ASPmW1rakSCkQuuf
X-Received: by 2002:a17:903:291:b0:2c1:f262:4962 with SMTP id d9443c01a7336-2ca7e6da0c0mr47279945ad.20.1782972529039;
        Wed, 01 Jul 2026 23:08:49 -0700 (PDT)
X-Received: by 2002:a17:903:291:b0:2c1:f262:4962 with SMTP id d9443c01a7336-2ca7e6da0c0mr47279405ad.20.1782972528367;
        Wed, 01 Jul 2026 23:08:48 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9aa00970sm8176325ad.71.2026.07.01.23.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 23:08:48 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 11:38:20 +0530
Subject: [PATCH 1/4] PM: runtime: Clear runtime_error on supplier after
 failed get_sync
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-1-6ddc317011c0@oss.qualcomm.com>
References: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-0-6ddc317011c0@oss.qualcomm.com>
In-Reply-To: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-0-6ddc317011c0@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Dilip Kota <dkota@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782972515; l=1363;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=YWgBvXVXF70bptWYE1RikhsP4a8CbIlb6SjMxl7HeAo=;
 b=eGIuy08vrYVbcIxdGvnJdWobvqVc5GrVZ7OD/RcJlS0vqo02DvksM+Tt0rOqqgYWAVVDl+SBe
 dL8ayeM0rAiBuWv4QyRzFiGt3oWGRwtwUlR27Bje4QrlZB4ffTgSOr6
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: aXT4Ysta-UFtK_vlKZD0KdkzOJV-N7U3
X-Proofpoint-ORIG-GUID: aXT4Ysta-UFtK_vlKZD0KdkzOJV-N7U3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA2MCBTYWx0ZWRfXww2wpKyhBkaU
 WFPieyjse3o9sRyHzjXlrgxVdRKdQ0F68g/m09A2oAZS1l9TIAum6efJIv4H/OBH7ItCJlZJbPP
 fD/JxBIgUfSDuZi0lMXSg2fFSd02pjTIHlVRLOeulqU/3hlp0Es9GIG+ocXp+EAWldODOPRMx3F
 1fRBgDiKAxV/6UlVkPaeGnKlO4Fgx+HaPY1dwjzKQjO/zqTtWREVHoljJETPRzu3yx5Qb0mzcqB
 tASCdFSVK7g+6k8RF9EnXZ5P7w+mm5sB8afBQYou6Hzx7vm8CxehsZCkvfNth0+8syQZO2Fy6pu
 eQFPbJZfcH9bC/p5V6aZjdYhiS/Ch430SwDe9syPjxhpBmmK4FVjk93ZGJOy3u2uOC3PUoeJngn
 mqYUTf2L7FT9EgsGU9OTY2FxtRzbII5XeVCcH+vNnKua7dTHkIYBFTTq7k9tcjhelpSDgQ+e8Dm
 R2ylExTEAesreUO1Tqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA2MCBTYWx0ZWRfX2XV/JSOcLMz5
 N1D4QjgY3ykMVXf3/cKQx8nkEu3SwsFZAdJbPGH7OmfnmG6T41HCr0G3L5IXbq59bmzhVt2jBW3
 T28jNDiTMtFXOzJKDfwP9Ju9B2kFNOY=
X-Authority-Analysis: v=2.4 cv=UopT8ewB c=1 sm=1 tr=0 ts=6a460071 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=TbMguNdjUikXwpDzob0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115825-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:dkota@codeaurora.org,m:swboyd@chromium.org,m:girishm@codeaurora.org,m:alokc@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:rafael@kernel.org,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:dianders@chromium.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:praveen.talari@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1C306F3B74

When pm_runtime_get_sync() fails for a supplier device in
rpm_get_suppliers(), the supplier's power.runtime_error field is left
set. This causes any subsequent rpm_resume() call on that supplier to
immediately return -EINVAL at the top of the function without
attempting an actual resume, making the failure permanent until
runtime PM is explicitly re-enabled.

Fix this by calling pm_runtime_set_suspended() on the supplier after
pm_runtime_put_noidle() in the error path. This clears runtime_error
and resets the runtime PM status to RPM_SUSPENDED, allowing the next
consumer resume attempt to retry the supplier resume normally.

Change-Id: Id5067d09caca464f663fc95fe745d037e9c56664
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/base/power/runtime.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 335288e8b5b3..9811d024d140 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -309,6 +309,7 @@ static int rpm_get_suppliers(struct device *dev)
 		/* Ignore suppliers with disabled runtime PM. */
 		if (retval < 0 && retval != -EACCES) {
 			pm_runtime_put_noidle(link->supplier);
+			pm_runtime_set_suspended(link->supplier);
 			return retval;
 		}
 		refcount_inc(&link->rpm_active);

-- 
2.34.1


