Return-Path: <linux-arm-msm+bounces-97075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMcoJ0DOsWmQFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 21:19:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFEC269E60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 21:19:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1BB083034C25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 20:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C7F38D6BA;
	Wed, 11 Mar 2026 20:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="crT6w6Cm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HcJ4SV5j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17313909BF
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773260267; cv=none; b=NmZMDjCjXWQ3tY5sH4OBNDR7JXVQFzl0cutetzt93cltYFqLV/923t8mUxwx9n29Qgn9kSkx9fEXjeKFVSVwuu++6dsz7VFTMEmFJpKXiDNItlrESDFOhe6G1U9VXf2KTg8GfB0VQ9ZdA2ad4ayiXrsX1d41TrHaM01HSYgJ2GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773260267; c=relaxed/simple;
	bh=7SE5vZDOstE9Xf57n1Jrye22q6OMfp45ac26O+8OlYc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q9qmK07ikBLondjb73oeAH2ucV+uUlLBbcI7H/ea7ICs/aA9dY3BCmZA5ySnKtZrxrp59k1Egruys7YnEO2VkbE9SV6k+8AuYAt7ufFgsWsx7bT9+Ml9s3rDcyFDjpqdvLjPo4D/0/npAzmcw05TNfNwGqi1aCy3XCBUbxQq2Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=crT6w6Cm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HcJ4SV5j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BFv8K1915114
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s0pCDmC7QmjeiaXxXJ9e3qn6IfxRNTNI1GwlSoTLmF4=; b=crT6w6CmF8tFIeiA
	ins5WhSAOkjqc74M0EOdIAuyJbzpCIkiiGFOla6tbdW4cVN14pdgg5XrfOWd8Gjj
	CYtn41LAfyHikRk78WlWOCXLWwWofHJk7Ew7k/wH4Vo5NmRiz2QJqgEba3Doasu7
	+8CaQkHx5LtISvMaW+Yfjq1UQkhH+nduathbJ269y0UJygIVtDXj36Msg3657tpM
	mOAVqjOk9tNptD0oLBKc0eAfxQUSIE/KKA9wxQfzIqoWVPQ/986iosAm9twHN15k
	OQGplZ4IcwuoGAqGhEVmh1fyn7yLeTX4Aqh8miFUCTlr+mJwf8NJtPHTDNRbv4UL
	si+Odg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cubg20udn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:17:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb706313beso44096485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773260264; x=1773865064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0pCDmC7QmjeiaXxXJ9e3qn6IfxRNTNI1GwlSoTLmF4=;
        b=HcJ4SV5j8wRIQ30WuFJ1kyIBp+VLUx9DLiG8XA0Dcl9AI17pgKcXFd+erhwMV+gncc
         Ive+On2W7TIDOz/PpCSEGPgP7NqOrq196AIq1oCZHkeYSrmit63iHVyBe47ASMRIg0mC
         yldex3q86CUwk+LuE5GeZkOChfsixy81kjkxC+xwVGhbgEe8xICAgNgkyDtQMEqItQ+R
         KT5fUpu8er4tN6zTqlw5tr593wociLnghGCZnKv881nCM525/G5NHmQ8lHayEEyYRj3z
         MvSwfCuykR2PlXskKCaGBvQqZgU6zB+vds8k18UuNjwsQ2nkOP2q31VLo21s6P0MbLmV
         zFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773260264; x=1773865064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s0pCDmC7QmjeiaXxXJ9e3qn6IfxRNTNI1GwlSoTLmF4=;
        b=fWyDv5rfA++WnNoIM2UeEyDsFi7fsTCZ+HnWtuPg/zuHKTLeEyZ8S1ZsjEs+/I38HC
         vENVclgpprMtKg/UJuwn2YJLsYd5DyZ92LxTEL7v9/VEdzfmcoaKGlamJe3PdWo8MGh1
         +EYYp1JYC4yOtMNBiS+SDQEphyBcj+8/qq5g3UH/GbcEd8tH155ZpFGuwYO3ghe8lNfX
         jdvOoQrdFq0drn7oaM+7ErK0LB1DpTUKLd8vk7PFcGiGxiMEYVBK0gvB20NRq4U6H4MY
         h76HCb8Xjzt3mxsTKgFmOx7IyBfEm56Ji8dIGxz6Az4sS4Z+H00ZmOKesx913pKYD584
         uX3w==
X-Gm-Message-State: AOJu0Yyb8Zc08kKis5hONGVH/mDDN0BCIzCrH+NFkBLRiqxcZIiRstwM
	/Hu42y1MaW8uKG8UD/XxuEOd8xGdKJ7IBAjEx5rRLfSVjny9ONApsCpXRC2VDAOxTXcVMgzhMCU
	lVCUNReKlyYynZDxHlEv7s8OCBaWXegUoD8tisu+TzWJUnm/F5iio689g2AkVROgFlf7k
X-Gm-Gg: ATEYQzyMRqYrz9ryE2ZAVJiM1pHy9twOCLiyfLqpDMILm8RwT69wYZAhrVwlVtFfcTe
	wOkp2ybjDPOD9g0umaCLztYgnvAXvYROvRYtARLTpXH+rXmbNMSCVZNMpFcKGNhI6igBemV8Hw1
	Eaj08v4wJT9H5VUEIxjJVyenCsWEyuBJGfIplOnE3PWvzYx3ZFByF6y/Fmv4SX4lal1ZWJsooXx
	nAkF8dCS7QSjy75FV71MBICTGlyC2Ed28paeXH2WHTBaP1EUhy7ab/wh0wYSRfyvvNSxaxe05FV
	mHHx++EIfrEfCkuUj421efEncCEGQuz9dprt4hpzMZpWJ6F6PVHb+YxDXqA9+JuDOB43Haq31U8
	yO2oKiw/25bqL/6NtEWjXJwjI43K+ojTBPMLdIU+NiqOC
X-Received: by 2002:a05:620a:4009:b0:8c7:a53:4d17 with SMTP id af79cd13be357-8cda1955188mr518427685a.21.1773260263949;
        Wed, 11 Mar 2026 13:17:43 -0700 (PDT)
X-Received: by 2002:a05:620a:4009:b0:8c7:a53:4d17 with SMTP id af79cd13be357-8cda1955188mr518424985a.21.1773260263444;
        Wed, 11 Mar 2026 13:17:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fd3dsm79257255e9.10.2026.03.11.13.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 13:17:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 21:17:28 +0100
Subject: [PATCH 4/7] drm/msm/hdmi: Consistently use u32 instead of uint32_t
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-drm-msm-hdmi-cleanup-v1-4-c5535245f6de@oss.qualcomm.com>
References: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
In-Reply-To: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5244;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7SE5vZDOstE9Xf57n1Jrye22q6OMfp45ac26O+8OlYc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsc3ZlABg923DtFNon4w7UtYzxE++UxZpN1mdD
 yYuM/d9b9aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabHN2QAKCRDBN2bmhouD
 14BwEACOMpajqkKm0bcmSBekvIusi9wH5gcwyc8sWh/klCtx2IY0PKfVTCt/W9zcuY9KHBRglJQ
 E+5YNfhuImlHKXwBZjN3LLAt07y02QiuuVTe7bSpPpJyPhN5/Yvkx4IEd53BMDiq6RXzpD1PtF5
 //gPF8qo8XhGHrDmvHki5m2mjDNLNJu/vXpecnAoxZ+1KcM4IveElIZQ4rZpspt2RD8UrSSUrER
 L49DTobbLz5iqdMhfz8gGTdUjaNmcq8xOmoDeILoQbnCHcO+wG4LKxdZHwC4s9aHShJchhA5hjg
 ccX1xFRzdV9mkcvOfVYHAHaZh1JB04iYrbm2/TJAWFKV3fCevw7aOq3eLJ6z+Q8zzOi1c758dda
 Y/XBS1QOHKI+DZKOk2ICy9KBPnZzWk0qUzT6UelQaSsP/01fLOYTEPjyawXCBSC3V7bbHC0NzHZ
 u3kVVgB8155HW9CIx8mQBHQzA7UxR74j+d8UlfWqDJPdL2KX0UVAxVf0NftlPnkbBS7td77mL+z
 C5l2lCZ/95TPoKkDBb3pn9aueF+4mtZRt9ooFXjSbHml0LBDOfVY530cWhAw1DvVvjDr2aw5emA
 5/Nh9/03wXoOoFlAlwZzBzU4eEBCyjGzyIYh4ThZ6SfuxqcyUs4s5EoEYkLBbvL8tVQTmNkmLgl
 y5KnMXGp4XTQzfg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Htl72kTS c=1 sm=1 tr=0 ts=69b1cde8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-BdNwxT8-gaB3-AsIdYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE3MiBTYWx0ZWRfXxyTNvUJmaQ50
 lCgHciY4Bu7zr0HjCvbo8rmEvk50qamV8C3+ticdR+lce9MbQ44vPg8RtW5g9dkZJDvK8Za2lhr
 Qy6jIOdSKGqIltz2Lk9FZ+LdMVqRV7f/BEAECcA6+wbsocGkJSEK1bPJJokML6nyVWkC4a+hDJw
 ZR7pYrio7PQlKLlfYDhLi2H2a6Io6ZKASu43G1V5r39AtYy9s5n5J8TYmAGjsPuO9C+teDOD8PS
 zL59wzl+SuQQTCgpelG96Xsf0HEe1hxRb7BrusYwFSQhM9C/eLGLmWpFn4uPtJZWtLOLQfS4ZBl
 iSDJ7vjh0A0DX6jiJbxcF1w5Mkb3tN+g0MM27ZrR+PIPoUGs9DOZuCthTpNVWZsWQZtI/uRzsGG
 tANDbczi632Mwjxk/cVyY20HEjZwChxS2V72HN18tWqTQlInbDIAfoToGNZvo2SUVQo/a7kLstb
 BHMlwSE9sPbCMV4eDnA==
X-Proofpoint-ORIG-GUID: Mi8jReNK3hAZbm3JQreGZK5FG-FakT-M
X-Proofpoint-GUID: Mi8jReNK3hAZbm3JQreGZK5FG-FakT-M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110172
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97075-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9AFEC269E60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Linux coding style asks to use kernel types like u32 instead of uint32_t
and code already has it in other places, so unify the remaining pieces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c  |  5 ++---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  4 ++--
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    |  4 ++--
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c    | 12 ++++++------
 5 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 03aa29dbb2f5..06cb0247eb7e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -20,7 +20,7 @@
 
 void msm_hdmi_set_mode(struct hdmi *hdmi, bool power_on)
 {
-	uint32_t ctrl = 0;
+	u32 ctrl = 0;
 	unsigned long flags;
 
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
index d9a8dc9dae8f..249c167ab04d 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
@@ -17,8 +17,7 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 {
 	struct hdmi_audio *audio = &hdmi->audio;
 	bool enabled = audio->enabled;
-	uint32_t acr_pkt_ctrl, vbi_pkt_ctrl, aud_pkt_ctrl;
-	uint32_t audio_config;
+	u32 acr_pkt_ctrl, vbi_pkt_ctrl, aud_pkt_ctrl, audio_config;
 
 	if (!hdmi->connector->display_info.is_hdmi)
 		return -EINVAL;
@@ -43,7 +42,7 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 	acr_pkt_ctrl &= ~HDMI_ACR_PKT_CTRL_SELECT__MASK;
 
 	if (enabled) {
-		uint32_t n, cts, multiplier;
+		u32 n, cts, multiplier;
 		enum hdmi_acr_cts select;
 
 		drm_hdmi_acr_get_n_cts(hdmi->pixclock, audio->rate, &n, &cts);
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 9b7012692ece..a9eb6489c520 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -356,7 +356,7 @@ static void msm_hdmi_set_timings(struct hdmi *hdmi,
 				 const struct drm_display_mode *mode)
 {
 	int hstart, hend, vstart, vend;
-	uint32_t frame_ctrl;
+	u32 frame_ctrl;
 
 	hstart = mode->htotal - mode->hsync_start;
 	hend   = mode->htotal - mode->hsync_start + mode->hdisplay;
@@ -409,7 +409,7 @@ static const struct drm_edid *msm_hdmi_bridge_edid_read(struct drm_bridge *bridg
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	const struct drm_edid *drm_edid;
-	uint32_t hdmi_ctrl;
+	u32 hdmi_ctrl;
 
 	hdmi_ctrl = hdmi_read(hdmi, REG_HDMI_CTRL);
 	hdmi_write(hdmi, REG_HDMI_CTRL, hdmi_ctrl | HDMI_CTRL_ENABLE);
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 114b0d507700..2cccd9062584 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -65,7 +65,7 @@ void msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	struct device *dev = &hdmi->pdev->dev;
-	uint32_t hpd_ctrl;
+	u32 hpd_ctrl;
 	int ret;
 	unsigned long flags;
 
@@ -125,7 +125,7 @@ void msm_hdmi_hpd_irq(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	uint32_t hpd_int_status, hpd_int_ctrl;
+	u32 hpd_int_status, hpd_int_ctrl;
 
 	/* Process HPD: */
 	hpd_int_status = hdmi_read(hdmi, REG_HDMI_HPD_INT_STATUS);
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
index 6b9265159195..4a4a2cf90234 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
@@ -40,8 +40,8 @@ static int ddc_clear_irq(struct hdmi_i2c_adapter *hdmi_i2c)
 {
 	struct hdmi *hdmi = hdmi_i2c->hdmi;
 	struct drm_device *dev = hdmi->dev;
-	uint32_t retry = 0xffff;
-	uint32_t ddc_int_ctrl;
+	u32 retry = 0xffff;
+	u32 ddc_int_ctrl;
 
 	do {
 		--retry;
@@ -71,7 +71,7 @@ static bool sw_done(struct hdmi_i2c_adapter *hdmi_i2c)
 	struct hdmi *hdmi = hdmi_i2c->hdmi;
 
 	if (!hdmi_i2c->sw_done) {
-		uint32_t ddc_int_ctrl;
+		u32 ddc_int_ctrl;
 
 		ddc_int_ctrl = hdmi_read(hdmi, REG_HDMI_DDC_INT_CTRL);
 
@@ -92,13 +92,13 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 	struct hdmi_i2c_adapter *hdmi_i2c = to_hdmi_i2c_adapter(i2c);
 	struct hdmi *hdmi = hdmi_i2c->hdmi;
 	struct drm_device *dev = hdmi->dev;
-	static const uint32_t nack[] = {
+	static const u32 nack[] = {
 			HDMI_DDC_SW_STATUS_NACK0, HDMI_DDC_SW_STATUS_NACK1,
 			HDMI_DDC_SW_STATUS_NACK2, HDMI_DDC_SW_STATUS_NACK3,
 	};
 	int indices[MAX_TRANSACTIONS];
 	int ret, i, j, index = 0;
-	uint32_t ddc_status, ddc_data, i2c_trans;
+	u32 ddc_status, ddc_data, i2c_trans;
 
 	num = min(num, MAX_TRANSACTIONS);
 
@@ -119,7 +119,7 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 
 	for (i = 0; i < num; i++) {
 		struct i2c_msg *p = &msgs[i];
-		uint32_t raw_addr = p->addr << 1;
+		u32 raw_addr = p->addr << 1;
 
 		if (p->flags & I2C_M_RD)
 			raw_addr |= 1;

-- 
2.51.0


