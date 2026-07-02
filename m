Return-Path: <linux-arm-msm+bounces-115888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bYLMI6k0RmoPLwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:51:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A686F585F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:51:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Q/mDQ7xe";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=I+zeS5l8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115888-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115888-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC5E830D04F8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31557481253;
	Thu,  2 Jul 2026 09:36:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB37480942
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:36:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985018; cv=none; b=FIbBpQOkUuMEGgbJKa+qWUBz57CE+mmDdh20LWMRZNhZIsx1v+J1Xrk/f02Nj2geyLoglP6G69zZnxSA89bJFvE2j4+z6PzigsPD2bj2LH3qdxQ48X5Onj7rYydsX2VeOE7++pFhQ+A6MRz1DRxlqr6BCGyx+a8b3ntVCPjQUGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985018; c=relaxed/simple;
	bh=0kUm6iZWqG5LNuIEW9ZY5XabEz3/uGXV5l9LMOHtqBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pZRBq2nz9NpKzaL/OScEFwQ3G218KwSyH5ttMN4Kr4+aNGS6bN0Jpdy8iqiIJyKTUD2ubUWwhmaQ7nZbCbplpf/SCajeAs4/t1eE71QvL29a9NnqKyjbU1oQzL9RM0bEuY46+B5fLsYaHe39GXujhdhucFOK/yUrGbxYvItGLkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/mDQ7xe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+zeS5l8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628WRqM3050491
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qzssNrrhwsh4sqrlnwSb6YO2VDCtJexpyO/5tc+jank=; b=Q/mDQ7xelUqBQBIi
	pgU1MkWrAEY43QK8+SWGATyPNwy+PVWpi3A2ANEsVbSD4jOhh/EFJKeJvYjf/bhi
	e8Qr06vXoUIr9fWg+85Ke2/Mn9wzHTWTjoPcZxA3RL3MwTaL4/2sn0GH6UszU0oF
	Dms552YGpABdJPmYxVUEjv4tgdQhn5KDiC/h1DvgbTspHoIOWeT2vXsaO/f1dynN
	0d0+7TWcfA74x2fkIwsC/Iy61MVIIV9w/apFkErufgV33ZfSVJpjTy0aw37xcrcz
	/VfSRmd6PHXQWHblOY23S0Nitd/ibZygEFycb2ztgDNqM59NGHogaAO+YdMpR5L0
	YB3uZg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f56gpubyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:36:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e55721a8cso177737985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985015; x=1783589815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzssNrrhwsh4sqrlnwSb6YO2VDCtJexpyO/5tc+jank=;
        b=I+zeS5l8JPLGiKy2BtBbFNELRe6Mi7VjCRAi8dIwKUzadnoMuMFaaaGRhVumfP5HsM
         9BRdw97HPerb8rcwggrRvXpic30KmOJJuvhkGkLheTEw5eiBng2DBnovmp88tDXtBW6u
         caKyYSA2L5LOGqGFceNvyMxNMNw7lU+Vh0rzfww48gu1AveTNxYz7I5rB9V4Q5ls2QB/
         HaVIgVHaf7yVAtR1fsM8ZigmvEUOn6cnXwdjPUmF0DYvvKrGQaQj55Wh6xNApYIYtPjn
         s+H3UryAbTKKZ8TC7tv+J5hoEYwN02ZFjPD06iyx8bYuy81tKOABKECk16fLBuVUPcBc
         miOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985015; x=1783589815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qzssNrrhwsh4sqrlnwSb6YO2VDCtJexpyO/5tc+jank=;
        b=I2XFnHVJ2ULjjDarngP7M6uVIkI1o8WSwdD5flIoMig/7HRGF/Km6Gj/zDy5vrUZxV
         jdTyT1/37y2TFjHU7kq1CUtR9Sr6qQgXXc4t3Aij4ciumoyrorfXyJZB4BQpJZ55v0/W
         +dFhFvLH18USnHwWJTnkmkrG7YMO8P9txecm1/NxjoG8QOopuSnSOSqkNJMfgJmE1MX4
         Rni9x1rkUEiYAxUensEsyTwNmbTjXZtfS4BIz+rJQgX+APIXHQI7faK1SUhZBmWNQwEV
         HG6E7Bk35ytZdZpbaxnxRBL7qvntusxtmA1S3/oBLV0ziphXEOvZdrdXnId+iFXDuu7f
         MySA==
X-Gm-Message-State: AOJu0YwTZP/3ApiZkx1AffCH7iNRHGtfNHtssJ692IZluwOoJxd5mfGL
	yf2cBs53TmNmEISdmXAHwTtR7H/SprGLgPt0YN+fv52C55fZ3tw2tMSo5VnOggtAUyOq5Weh4Oj
	v6BQ9EuLE/LwwMbh5olAhpwgz39GAY4Xz2TjBHkrUQ2ukgdidahH1r1SHl5sp8jYE8KhN
X-Gm-Gg: AfdE7ckTOPHdqp23MEsuWP8FaHOtqkxsdpn2ohXhLVolNgajbdPEv+wI5cZ+dxTG56a
	hiKE3roVvxEkXVDPaiNA9mxZ4YF5GF0jJbxjpXCoz1/MC9+qrFl1hdWSMw8mjrBkAjCcfnEnjve
	fEBx4/kQA/dNf376d452joV6MzBYm5TDirIKh/rxSdSqlC6/ixmAgNCbNMl1BaNovi9J9t+GKXh
	Cs9kihq3hdldiAjLKylzoxidqkXY9fX5TcY9xVzSIIj6ykWBmI/AjhaegpWAw1ju6aXpagjX8aU
	d9z7jNc+yeL7Mz+62A4iGB48w5Z1Bf91ABzEp1Dos9fPcQjregwwmBDFOh/BP4o/+sCY3OpDmR3
	P9pqxOvMtFcmswFbTOyVYctvJ5QV2+f496NA=
X-Received: by 2002:a05:620a:2947:b0:92b:6805:91aa with SMTP id af79cd13be357-92e7851a911mr723527385a.66.1782985014715;
        Thu, 02 Jul 2026 02:36:54 -0700 (PDT)
X-Received: by 2002:a05:620a:2947:b0:92b:6805:91aa with SMTP id af79cd13be357-92e7851a911mr723522485a.66.1782985014066;
        Thu, 02 Jul 2026 02:36:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3db964sm7101335f8f.8.2026.07.02.02.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:36:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 11:36:40 +0200
Subject: [PATCH v2 1/2] drm/msm/hdmi_bridge: Simplify register bit updates
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-drm-msm-hdmi-cleanup-v2-1-a4a4f0e8895b@oss.qualcomm.com>
References: <20260702-drm-msm-hdmi-cleanup-v2-0-a4a4f0e8895b@oss.qualcomm.com>
In-Reply-To: <20260702-drm-msm-hdmi-cleanup-v2-0-a4a4f0e8895b@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8199;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0kUm6iZWqG5LNuIEW9ZY5XabEz3/uGXV5l9LMOHtqBU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqRjEvqg8NwMGHoCZ/+gBpwkyr3SceUxmA/vOq7
 DJm399oqveJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakYxLwAKCRDBN2bmhouD
 19LgD/93aR7dOpfuLnOeH0zp0JZOjdpjAIN0dUzgba07j3qfxLEum7tcivrOtw1wsreb2qQp9/s
 v4NP/EHsnf94y3fTBcL63hD1Te9mueY48vzoKbMUUxSLFZx8+fLGaJFq9hlOvFEIUsUbjyP0619
 XnacqiEwW3/GzHHe4+U4r7mhhXBI+M4jiQgDbaFWEy6WeCAB5qzn1j/c07QsnixWDunz4efGQDj
 5P/PQcv/cGo/CgojBYPFq0UzVcw00N4M+lpY1A3lHfTpiEciWuecIBPqyjD6TYSimUvEpjnc44S
 pXa5CJD1HBjmREagzxObJr0jc3WPsKPK1IO4IIWaByeRiCmZ4fm+3YGqTZx2oaZEDAjj3L1ZzSl
 kTA6aCwGF39ZcyigS6loMrqQ1gsMfLeJcMta9+yez2X/nI3jE9TMYYMfoPXRa8MBuKhcOvjm8y4
 8c2KbPrMLpvs0anV5joDwjyMEFPrrNs7mHirLOtrcLiAuqQDNOy3Smd3uclQFFvs/1tNDwEpieY
 U9gXSbxA2HLz+vOi15CwIpS4keeO34yq3Mx5zzpCNBrVYbpvrhXVrlwWzlK25CPI+BgsiEQur0E
 egSWRMOReNnM8ruSJDRXYs9qmroMVdorsF9nKIfj0kF9NfWMGdQDnmP8WjH4RS9XxJnECvmldNB
 /7qiPU1m0+zet+g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX7Jpyob+Jkcok
 493ah3xAPnvrNrS8MiMqS7jptuUYjmEw5oxwzjelb3mpTXPrcjBfBBP/+i1LL7/VGF4GA4hCFHS
 pTsFIsFBPM1Z5lMZPvsPI+B4wJFJ/8w=
X-Proofpoint-GUID: i--Vc8sPTF0Bd5Womk-xILQPzJm2Q20G
X-Proofpoint-ORIG-GUID: i--Vc8sPTF0Bd5Womk-xILQPzJm2Q20G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX6kTR4+kTFovA
 0DcYUbG9olUV49lMpZJR3bbNBdGFGbCrzgYNTJn6oBi9fDIhlgx3fKbLXSRTWOSoJvrle1W2nFT
 oc+n1XLSAWGZCgekzBF10YtpzjdpyZQ+STh9AxuRbw1bqR9jwrB7f9cofDOvWMahX9cVsDB/Imz
 ChCaz83C7ADBgsCU2aEl7grbLL6MjwcGSAHq7pq9B6zbdQ2w0d0bITUT97/3aH8no+p6dM4VIFR
 PPB7W9A3VHhjfXkb94MRDpU/NEuaAXqTLxFSemi7VBGxbdZ1bwQ7TFPb6IHnCL0CPzcPMX4qZd5
 KNn2DS7wPes1aMa14tckUPV1Fnh+przIZAexK0XLt2DydQfKPi+ZBkGARw9LxeCaxwGFf8I8JQG
 YEXLOFTXi0GhJ4PM2+8A8h8LhuRGyEaKVOIjkn8CKUuFvUNreNKlnkBQMs6cXL8LJOW7GW5cyf9
 afYpVRKYUbRihOkulhg==
X-Authority-Analysis: v=2.4 cv=K9oS2SWI c=1 sm=1 tr=0 ts=6a463137 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=aOjUM9GFJvKfr9THBUUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115888-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1A686F585F

Simplify reister updates (read, apply mask, write) with a wrapper to
make code more obvious and avoid possible errors of reading and writing
to different registers.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi.h        | 19 +++++++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 98 ++++++++++++++--------------------
 2 files changed, 60 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 49433f7727c3..436d4f9fe346 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -112,6 +112,25 @@ static inline u32 hdmi_read(struct hdmi *hdmi, u32 reg)
 	return readl(hdmi->mmio + reg);
 }
 
+static inline void hdmi_clear_bits(struct hdmi *hdmi, u32 reg, u32 mask)
+{
+	u32 val;
+
+	val = hdmi_read(hdmi, reg);
+	val &= ~mask;
+	hdmi_write(hdmi, reg, val);
+}
+
+static inline void hdmi_update_bits(struct hdmi *hdmi, u32 reg, u32 mask, u32 data)
+{
+	u32 val;
+
+	val = hdmi_read(hdmi, reg);
+	val &= ~mask;
+	val |= data & mask;
+	hdmi_write(hdmi, reg, val);
+}
+
 static inline u32 hdmi_qfprom_read(struct hdmi *hdmi, u32 reg)
 {
 	return readl(hdmi->qfprom_mmio + reg);
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index c4d5e0faf3b3..9773459250bd 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -58,16 +58,13 @@ static int msm_hdmi_bridge_clear_avi_infoframe(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	u32 val;
 
-	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
-	val &= ~(HDMI_INFOFRAME_CTRL0_AVI_SEND |
-		 HDMI_INFOFRAME_CTRL0_AVI_CONT);
-	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
+	hdmi_clear_bits(hdmi, REG_HDMI_INFOFRAME_CTRL0,
+			HDMI_INFOFRAME_CTRL0_AVI_SEND |
+			HDMI_INFOFRAME_CTRL0_AVI_CONT);
 
-	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
-	val &= ~HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK;
-	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
+	hdmi_clear_bits(hdmi, REG_HDMI_INFOFRAME_CTRL1,
+			HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK);
 
 	return 0;
 }
@@ -76,18 +73,15 @@ static int msm_hdmi_bridge_clear_audio_infoframe(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	u32 val;
 
-	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
-	val &= ~(HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND |
-		 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT |
-		 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE |
-		 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE);
-	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
+	hdmi_clear_bits(hdmi, REG_HDMI_INFOFRAME_CTRL0,
+			HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND |
+			HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT |
+			HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE |
+			HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE);
 
-	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
-	val &= ~HDMI_INFOFRAME_CTRL1_AUDIO_INFO_LINE__MASK;
-	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
+	hdmi_clear_bits(hdmi, REG_HDMI_INFOFRAME_CTRL1,
+			HDMI_INFOFRAME_CTRL1_AUDIO_INFO_LINE__MASK);
 
 	return 0;
 }
@@ -96,13 +90,11 @@ static int msm_hdmi_bridge_clear_spd_infoframe(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	u32 val;
 
-	val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
-	val &= ~(HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
-		 HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
-		 HDMI_GEN_PKT_CTRL_GENERIC1_LINE__MASK);
-	hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+	hdmi_clear_bits(hdmi, REG_HDMI_GEN_PKT_CTRL,
+			HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
+			HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
+			HDMI_GEN_PKT_CTRL_GENERIC1_LINE__MASK);
 
 	return 0;
 }
@@ -111,14 +103,12 @@ static int msm_hdmi_bridge_clear_hdmi_infoframe(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	u32 val;
 
-	val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
-	val &= ~(HDMI_GEN_PKT_CTRL_GENERIC0_SEND |
-		 HDMI_GEN_PKT_CTRL_GENERIC0_CONT |
-		 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE |
-		 HDMI_GEN_PKT_CTRL_GENERIC0_LINE__MASK);
-	hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+	hdmi_clear_bits(hdmi, REG_HDMI_GEN_PKT_CTRL,
+			HDMI_GEN_PKT_CTRL_GENERIC0_SEND |
+			HDMI_GEN_PKT_CTRL_GENERIC0_CONT |
+			HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE |
+			HDMI_GEN_PKT_CTRL_GENERIC0_LINE__MASK);
 
 	return 0;
 }
@@ -129,7 +119,6 @@ static int msm_hdmi_bridge_write_avi_infoframe(struct drm_bridge *bridge,
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	u32 buf[4] = {};
-	u32 val;
 	int i;
 
 	if (len != HDMI_INFOFRAME_SIZE(AVI) || len - 3 > sizeof(buf)) {
@@ -153,15 +142,13 @@ static int msm_hdmi_bridge_write_avi_infoframe(struct drm_bridge *bridge,
 	for (i = 0; i < ARRAY_SIZE(buf); i++)
 		hdmi_write(hdmi, REG_HDMI_AVI_INFO(i), buf[i]);
 
-	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
-	val |= HDMI_INFOFRAME_CTRL0_AVI_SEND |
-		HDMI_INFOFRAME_CTRL0_AVI_CONT;
-	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
+	hdmi_update_bits(hdmi, REG_HDMI_INFOFRAME_CTRL0,
+			 HDMI_INFOFRAME_CTRL0_AVI_SEND | HDMI_INFOFRAME_CTRL0_AVI_CONT,
+			 HDMI_INFOFRAME_CTRL0_AVI_SEND | HDMI_INFOFRAME_CTRL0_AVI_CONT);
 
-	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL1);
-	val &= ~HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK;
-	val |= HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE(AVI_IFRAME_LINE_NUMBER);
-	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
+	hdmi_update_bits(hdmi, REG_HDMI_INFOFRAME_CTRL1,
+			 HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK,
+			 HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE(AVI_IFRAME_LINE_NUMBER));
 
 	return 0;
 }
@@ -193,12 +180,11 @@ static int msm_hdmi_bridge_write_audio_infoframe(struct drm_bridge *bridge,
 		   buffer[9] << 16 |
 		   buffer[10] << 24);
 
-	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
-	val |= HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND |
-		HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT |
-		HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE |
-		HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE;
-	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
+	val = HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND |
+	      HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT |
+	      HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE |
+	      HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE;
+	hdmi_update_bits(hdmi, REG_HDMI_INFOFRAME_CTRL0, val, val);
 
 	return 0;
 }
@@ -231,11 +217,10 @@ static int msm_hdmi_bridge_write_spd_infoframe(struct drm_bridge *bridge,
 	for (i = 0; i < ARRAY_SIZE(buf); i++)
 		hdmi_write(hdmi, REG_HDMI_GENERIC1(i), buf[i]);
 
-	val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
-	val |= HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
-		 HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
-		 HDMI_GEN_PKT_CTRL_GENERIC1_LINE(SPD_IFRAME_LINE_NUMBER);
-	hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+	val = HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
+	      HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
+	      HDMI_GEN_PKT_CTRL_GENERIC1_LINE(SPD_IFRAME_LINE_NUMBER);
+	hdmi_update_bits(hdmi, REG_HDMI_GEN_PKT_CTRL, val, val);
 
 	return 0;
 }
@@ -269,12 +254,11 @@ static int msm_hdmi_bridge_write_hdmi_infoframe(struct drm_bridge *bridge,
 	for (i = 0; i < ARRAY_SIZE(buf); i++)
 		hdmi_write(hdmi, REG_HDMI_GENERIC0(i), buf[i]);
 
-	val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
-	val |= HDMI_GEN_PKT_CTRL_GENERIC0_SEND |
-		 HDMI_GEN_PKT_CTRL_GENERIC0_CONT |
-		 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE |
-		 HDMI_GEN_PKT_CTRL_GENERIC0_LINE(VENSPEC_IFRAME_LINE_NUMBER);
-	hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+	val = HDMI_GEN_PKT_CTRL_GENERIC0_SEND |
+	      HDMI_GEN_PKT_CTRL_GENERIC0_CONT |
+	      HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE |
+	      HDMI_GEN_PKT_CTRL_GENERIC0_LINE(VENSPEC_IFRAME_LINE_NUMBER);
+	hdmi_update_bits(hdmi, REG_HDMI_GEN_PKT_CTRL, val, val);
 
 	return 0;
 }

-- 
2.53.0


