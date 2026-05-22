Return-Path: <linux-arm-msm+bounces-109285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAbOCdBFEGpqVgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:02:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A3D5B3728
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA32A30464AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4B63F164F;
	Fri, 22 May 2026 11:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="geBNzBf0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iq7gFbYM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D953E5A20
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451013; cv=pass; b=Nq4VKUYven82KztHbpvDJBYZcIhjBLAZK/BuzXPm4JZzZQt8hlyB9LTwqt/ToJdXdFK0CKVGcvmMoW92Aw0TUd7CF3L7NKGsovQVKlYjdwC8hwe5aJJN65VPFxUlKg7ftNd8P9V0iZwymggmFfz3urX/KG4Y+FQZBbY7kUHL+VM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451013; c=relaxed/simple;
	bh=UHeYwpLlu4xyhkYrJFZ42t/H2IN2z1iphYnl0K1Rsv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B6hd940+WAnyPdVVRHHZjh0Mqr+isNsLjXqKpVgyyupf+I2SWjlm+VYvqDZBrIrK7d2H+I3u0fcThT2WUO3jwU0Dmd0ctQr/0TGcyfp1E6YVx3P5zR2mmpjL7tJKgNhXVFWTP3NTLTwnytmT3EqTD+FUhmy2kxx6ZL8DcZ3xM44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=geBNzBf0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iq7gFbYM; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M98iH91816103
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BfxQWgFxKuSlI+XcJxtqMogzPioT1S44n+WuIdPEiqo=; b=geBNzBf05MTME0eV
	qYAswt1xooJzuN4vo9X+7HlQnTb9BsoYYDgbxoxM17UERtEX/twUAVJeUikkW05t
	xYeJgllqRyn+KJW8/C7nlOelTwErYv5l8YZrtVHNfI6NYyTebn4lVR7iNi0nKXLN
	4ZdBxGTUk3Bt7eDkhWtfscUrrVMKWrCDJdToDHu1xm32CmC+DqWgFaMdQqVHtclE
	wWMZ9lFcQeAQckvbuXBLObD+rfxCdH9XeaHGKBFEXwh56kX4hCV1qBMPqGwYAUD5
	CgGK1pSvjHPO9fyWuL9ZpfVFTbw9nSUDrO10zBBjcqIlD3kv9EAecg17Ge/7Pyy9
	HNU6qw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm1thp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:56:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bc6899bfb1so73684975ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 04:56:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779451009; cv=none;
        d=google.com; s=arc-20240605;
        b=bAX2fH8QtHcFs0bmnfuwiTvzC8ejJjGpdwsBgz+S5bGNX+nJcCiG+GorDJUquadQbS
         zCXg3XjRRoKKlV0LUYmE61YyulghZJwKdR4FL+KaATKbCgxZUJYb8fxXK94BWOure7Bl
         UPBtflkZ/oAdvKDrvgE6m6SIcGpNVJi8mc1uxwxAA6yJkJ6OlzL+jv71w2Q1s/RmrHl5
         JR9VisewV34PLe823zNjJZpK2t6VwQjJjiszR1sXmeebYACYRkHWyUGabWPYLYaf0vbr
         qQP4sZ4QS4NSJvAhzVYrvzk61UkWS1xm8Q1Q8UAyAbE79v/zn0YgGn3ulUcIxh3E7Wzj
         RAZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BfxQWgFxKuSlI+XcJxtqMogzPioT1S44n+WuIdPEiqo=;
        fh=vcO+lsbNacj0NQOWnpsIZNycbzH1clP5auyVH0iEIhg=;
        b=EA0kpM5E0SEYOSUmslE7UkdpdxqppFFoqHQTgr9EXAyw5hhTaU0zGHnO3l8irT0U5+
         NiSISDeGsNnP41XpSCrL6R9rIUHDrTHZXLnRij0s54FPu6iutRZt2hM91RuArbO9M17i
         tWAd292BPpHKD32E6tjWuISPl+w+yZkHp8LgbdKTx/53C8M+YNjaSQemI1dPqem24H1o
         KroJLL4ZR+zzksxKSMyWGDOh6igBQ4apcCSyaQ24R/bjd6ATsim7YMFrX7KglLUHc2ny
         hqdyCbIT7dH7bykn31qXjAOP0beaAFL4MiU2b95nA6K+yzjy8IhIXeow9i9S5uwQ7b7t
         7ysw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779451009; x=1780055809; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfxQWgFxKuSlI+XcJxtqMogzPioT1S44n+WuIdPEiqo=;
        b=Iq7gFbYMTVFZVnKeSrgWXrHTgnqVvEqhQER0uiDY78EYIWewejfpNRGTwG0xfMhQv/
         yoYH413PM96x+zWcmnnZyn5LF6Ai2MTd9wOS6NOnUsHU9mO4qGMVA5DdngY9z1e7venp
         VQA+20+/vl6PGzt05BBSZ98f3ZqYujfGHTfvVp3p4JCIV8rtyrfDCoZa0SNwZtNLC+5C
         l79En1vjyKNbbfE3+A2oBx2tfGcF2D+kiL7XuwMhsulmhN+OdZdsW5mWys4KV4S7a4Ab
         UkUQaykuGGLfe7w4olftBlGTsShMQwetH3jSjkLDszHgaSgRpmSsu62W7qJUxCmPPpIz
         MElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779451009; x=1780055809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BfxQWgFxKuSlI+XcJxtqMogzPioT1S44n+WuIdPEiqo=;
        b=sidnQj6NAiFYtENcXV3avMPpcOeHGNozz9EpE8El2d6NqO60c25VjSOEm04tVJzVJT
         AERAtyQ5MDEWWgO3baN/0/V+ObawZOnTO3s7nWFZO9tCu4s1O+zxD8GDCBlG+VB07C5u
         PHMM2NIzJdl8RkNw2MNnSd4MbA29BXPY6uIOsktJqvI/Ch/rhX26XYjTFrFICmuiTdH8
         cX0cunMPqM/2gbzlKJIEy2cE/5Jw4eViBxcSwS8f++NImy8XTx/3fhRTo1UHZiCnKPew
         A/bDFHn+tmQyImDcF43FQqeGjzm/zDnvfCSKLoqzEUYNM+rlbN7qdSHbaMkR9hDJWxwO
         sATA==
X-Forwarded-Encrypted: i=1; AFNElJ+m3uwgAsFrgdVY4ixCIVdlVOfddrHQULjg9ssjxSlL5f7je95R9vQu/BFIfRWA84diY7t6BBx4aYySFYUR@vger.kernel.org
X-Gm-Message-State: AOJu0YwvoQvcDpJ6V3SFjFpUt4vqxCWRi3YZ5eTBGeh+fBtWkDheg6gG
	FWlmSMr4rhLKx78kFdmMs337D6gwt039GZubjk3kQBfKgPMdoF1KNAQi9imgIajdH/tEo4difbr
	t35JXnb/cOZl/MW3dMz56BiCGeObrR+Au/c01jzjEOPFFOFLqp/B9SDne5vlMNwMLf0wfWZvkoc
	w0Mjg63jxW/0k69WDVQLy/X7XQsaZj9dFT7wd1Hxoq5iM=
X-Gm-Gg: Acq92OH7B9S6A/woCxbVaTtrAVuK4jL+k9uXeO5OesE8V2B36/soyDk1nQT3cDOVj83
	CI5kXqOk54ZYT8xz/mrqidpsCg4iHwN3ldrdIXhEveXCoQxYmk5kwv/Ewo/gHYC66K7EbosduAD
	2TKSnaxY2ijKVjyxndE/ZmK6+AnJWPd1wbOTL2cDDnIqGqDR9Evzs9EJhB1MLxuukqmihhqWyVt
	1RfLA==
X-Received: by 2002:a17:903:2390:b0:2bc:b80f:6782 with SMTP id d9443c01a7336-2beb0356171mr37657615ad.11.1779451008485;
        Fri, 22 May 2026 04:56:48 -0700 (PDT)
X-Received: by 2002:a17:903:2390:b0:2bc:b80f:6782 with SMTP id
 d9443c01a7336-2beb0356171mr37657235ad.11.1779451007888; Fri, 22 May 2026
 04:56:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-31-01faacfcdedd@oss.qualcomm.com> <pc4brjias4ixewzlsvnlhqhlz774z4p6aq7j4kldu5ze2e35sh@tsm2mtrkk3zi>
 <b5b3b1b8-ed48-429c-a87f-0278a6632313@oss.qualcomm.com> <tlt2ffn2xz3mpeoojcciieh35zc6pyowlkcjtxkkrnaj32enne@mbcrdrnkmaoz>
 <07ff4730-2efd-4e9d-b632-9fbb517179f9@oss.qualcomm.com> <vdjgzhx4xkvid2ukp7j3yir3n4tr423riyzvyzkrh2ssiub5at@pj6wfcy4jz5q>
 <4b18f14f-d485-4b9c-a75c-ead6f7c80f95@oss.qualcomm.com> <k6y3e4fqfwkevvvv3zmzmovsrz4i6qkxs3duhz7khsggxwwa77@uogtrpuaxhnc>
 <d4c5d26c-47f1-4e42-9852-d407982cb4f6@oss.qualcomm.com> <djigwx5k7j2rkaoq7g6paor6l6i25srvq7chjqqnjlbs3shcco@x5drauwxzngp>
 <6a5144f5-8734-40ae-b170-eae107089a3e@oss.qualcomm.com>
In-Reply-To: <6a5144f5-8734-40ae-b170-eae107089a3e@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:56:36 +0300
X-Gm-Features: AVHnY4KoZE6VMWmY1smVEZ2rS8RaAHpQGDsUz06mMBB6vW75iFiz_e_W26YjgfM
Message-ID: <CAO9ioeWBvrsiiEDAUxCHQKU8CC6wnm_c0fyXeWhzrEGyvdbrSg@mail.gmail.com>
Subject: Re: [PATCH v3 31/38] drm/msm/dp: add HPD callback for dp MST
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 0BIDSQ_o25z8ej6JVKedaHtegD5GeqJ3
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a104481 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=t178-CUVSRCeDOQkBIQA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExOSBTYWx0ZWRfX2uix830MbhtB
 loE5cmeY729k8+n4EnTrcUl/YgcT4pQDOH5dwrWUPd4IFAR9gfj2p3e+xg8XtsUsHuiFlbZUds5
 xCfy+qpeLx4eUuuqsGXTD6IUxku3EhK9rMmFlqvZ05VLujHPGJ+7ETQdTVzHHbcTXgNkU6+mzQ4
 1gNUCRa1nWK2q46kZyqjJIer+EbFn96BP5aTL0azqPH0bZrNACJQKHCBMbN+M0MHGmp7eqdEzRC
 hPtvKU1zXj0jGlsXQYsKB/fNiupx65ZtuP+giqepzzU4vZHuCTbUapzrGzj6BH5OFr34F8Xh08s
 S7KQgNAtGs/9yQRmgXr8cN4/CcMb276NOfVS3TMu/vfvbWbkLEgIFdlIp/Ya05j5mlAr9Eds6C/
 OtutWE7pw3Hinna2iTj9YTiEtG/gNtECjIinTY1YnNk0JPKSoy3+IsP+67MFbhZdY3zBFMohXHQ
 3h1fq8l7MxU3iJjV2RA==
X-Proofpoint-GUID: 0BIDSQ_o25z8ej6JVKedaHtegD5GeqJ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220119
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109285-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.c.6.3.0.1.0.0.e.4.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,patchwork.freedesktop.org:url,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: B9A3D5B3728
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026 at 15:29, Yongxing Mou
<yongxing.mou@oss.qualcomm.com> wrote:
>
>
>
> On 5/19/2026 12:36 AM, Dmitry Baryshkov wrote:
> > On Thu, May 14, 2026 at 03:12:17PM +0800, Yongxing Mou wrote:
> >>
> >>
> >> On 4/19/2026 8:29 AM, Dmitry Baryshkov wrote:
> >>> On Wed, Apr 15, 2026 at 06:32:29PM +0800, Yongxing Mou wrote:
> >>>>
> >>>>
> >>>> On 4/15/2026 2:43 AM, Dmitry Baryshkov wrote:
> >>>>> On Tue, Apr 14, 2026 at 05:51:51PM +0800, Yongxing Mou wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 3/25/2026 3:30 AM, Dmitry Baryshkov wrote:
> >>>>>>> On Tue, Mar 24, 2026 at 09:04:24PM +0800, Yongxing Mou wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 8/27/2025 2:40 AM, Dmitry Baryshkov wrote:
> >>>>>>>>> On Mon, Aug 25, 2025 at 10:16:17PM +0800, Yongxing Mou wrote:
> >>>>>>>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>>>>>>>>
> >>>>>>>>>> Add HPD callback for the MST module which shall be invoked fro=
m the
> >>>>>>>>>> dp_display's HPD handler to perform MST specific operations in=
 case
> >>>>>>>>>> of HPD. In MST case, route the HPD messages to MST module.
> >>>>>>>>>>
> >>>>>>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>>>>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> >>>>>>>>>> ---
> >>>>>>>>>>       drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++++---
> >>>>>>>>>>       drivers/gpu/drm/msm/dp/dp_mst_drm.c | 34 +++++++++++++++=
+++++++++++++++++++
> >>>>>>>>>>       drivers/gpu/drm/msm/dp/dp_mst_drm.h |  2 ++
> >>>>>>>>>>       3 files changed, 48 insertions(+), 3 deletions(-)
> >>>>>>>>>>
> >>>>>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu=
/drm/msm/dp/dp_display.c
> >>>>>>>>>> index abcab3ed43b6da5ef898355cf9b7561cd9fe0404..59720e1ad4b119=
3e33a4fc6aad0c401eaf9cbec8 100644
> >>>>>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >>>>>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >>>>>>>>>> @@ -500,9 +500,16 @@ static int msm_dp_display_handle_irq_hpd(=
struct msm_dp_display_private *dp)
> >>>>>>>>>>       static int msm_dp_display_usbpd_attention_cb(struct devi=
ce *dev)
> >>>>>>>>>>       {
> >>>>>>>>>> -    int rc =3D 0;
> >>>>>>>>>> -    u32 sink_request;
> >>>>>>>>>>              struct msm_dp_display_private *dp =3D dev_get_dp_=
display_private(dev);
> >>>>>>>>>> +    struct msm_dp *msm_dp_display =3D &dp->msm_dp_display;
> >>>>>>>>>> +    u32 sink_request;
> >>>>>>>>>> +    int rc =3D 0;
> >>>>>>>>>> +
> >>>>>>>>>> +    if (msm_dp_display->mst_active) {
> >>>>>>>>>> +            if (msm_dp_aux_is_link_connected(dp->aux) !=3D IS=
R_DISCONNECTED)
> >>>>>>>>>> +                    msm_dp_mst_display_hpd_irq(&dp->msm_dp_di=
splay);
> >>>>>>>>>> +            return 0;
> >>>>>>>>>> +    }
> >>>>>>>>>>              /* check for any test request issued by sink */
> >>>>>>>>>>              rc =3D msm_dp_link_process_request(dp->link);
> >>>>>>>>>> @@ -1129,8 +1136,10 @@ static irqreturn_t msm_dp_display_irq_t=
hread(int irq, void *dev_id)
> >>>>>>>>>>              if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
> >>>>>>>>>>                      msm_dp_display_send_hpd_notification(dp, =
false);
> >>>>>>>>>> -    if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
> >>>>>>>>>> +    if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
> >>>>>>>>>>                      msm_dp_display_send_hpd_notification(dp, =
true);
> >>>>>>>>>> +            msm_dp_irq_hpd_handle(dp, 0);
> >>>>>>>>>
> >>>>>>>>> Why is it a part of this patch?? It has nothing to do with MST.
> >>>>>>>>>
> >>>>>>>> Emm ... maybe here we can directly call msm_dp_mst_display_hpd_i=
rq..
> >>>>>>>> I tried an alternative approach by calling the MST IRQ handler f=
rom
> >>>>>>>> msm_dp_bridge_hpd_notify(). I expected that when hpd_isr_status =
=3D=3D
> >>>>>>>> DP_DP_IRQ_HPD_INT_MASK, the hpd_link_status read in
> >>>>>>>> msm_dp_bridge_hpd_notify() would be ISR_IRQ_HPD_PULSE_COUNT. Tha=
t way, we
> >>>>>>>> could handle both SST and MST interrupt paths in msm_dp_irq_hpd_=
handle().
> >>>>>>>> However, hpd_link_status only reports ISR_CONNECTED. So I had to=
 move the
> >>>>>>>> MST IRQ handling into the IRQ thread. Do you have any suggestion=
s on this?
> >>>>>>>
> >>>>>>> When are the link status bits updated? Please remember, we need t=
o
> >>>>>>> support all three cases:
> >>>>>>>
> >>>>>>> - Native DP, native DP HPD pin handling
> >>>>>>> - Native DP, DP HPD pin not handled by the controller
> >>>>>>> - DP AltMode, DP HPD pin not used at all
> >>>>>>>
> >>>>>>> In the second and the third cases we will not be getting the IRQs=
.
> >>>>>>> Instead one of the next bridges (connector, EC, AltMode, etc.) wi=
ll send
> >>>>>>> the HPD event, which lands in the .hpd_notify() callback.
> >>>>>>>
> >>>>>> I added some logs and did some testing. I think
> >>>>>> msm_dp_aux_is_link_connected() only shows the current HPD state. S=
ince IRQ
> >>>>>> HPD Pulse Count is very short, by the time we read REG_DP_DP_HPD_I=
NT_STATUS
> >>>>>> in the IRQ flow, the HPD state machine has usually already finishe=
d pulse
> >>>>>> classification and returned to Connected.
> >>>>>
> >>>>> But the IRQ should be sticky and it should be readable from the sta=
tus
> >>>>> bits.
> >>>>>
> >>>> Yes... I=E2=80=99m not sure how this is handled on other platforms, =
but on LeMans
> >>>> can not get IRQ status from msm_dp_aux_is_link_connected().
> >>>
> >>> Can we clarify that somehow? Maybe with the hardware team if it is
> >>> uncear from the HPG?
> >>>
> >>>>> Note, in the USB-C AltMode case the HPD machine is not used at all.
> >>>>>
> >>>>>>
> >>>>>> Because of that, the condition hpd_link_status =3D=3D ISR_IRQ_HPD_=
PULSE_COUNT
> >>>>>> will usually not be hit.
> >>>>>>
> >>>>>> do you have any suggestion that in how to distinguish between an I=
RQ event
> >>>>>> and a plug event in .hpd_notify() better? We probably don=E2=80=99=
t want to
> >>>>>> introduce another state machine.
> >>>>>
> >>>>> Then, I assume, currently there is no way to actually distinguish t=
hose.
> >>>>> The easiest way to handle the replug would be to store the current
> >>>>> "connected" status and verify if we are receiving "connected" while
> >>>>> being connected or if it is a disconnected -> connected change.
> >>>>>
> >>>> Emm.. Currently, regardless of whether it is the native DP HPD (on L=
eMans)
> >>>> or DP over Type=E2=80=91C Alt Mode(test on Hamoa), a single plug eve=
nt always
> >>>> results in two or more identical .hpd_notify() callbacks.
> >>>
> >>> Could you please check, why? On Hamoa it might be because of the LTTP=
Rs.
> >>>
> >>>> In other words, after the transition from disconnected =E2=86=92 con=
nected is
> >>>> completed, there is still one more .hpd_notify() with connected =E2=
=86=92 connected.
> >>>> So it still can store "connected" to distinguish between an IRQ even=
t and a
> >>>> plug event from .hpd_notify()?
> >>>
> >>> I've sent a series, which explicitly tracks the IRQ events. Hope that
> >>> helps.
> >>>
> >> Very thanks for sending the HPD IRQ series
> >> https://patchwork.freedesktop.org/series/151522/. it very helpful for =
TYPE-C
> >> MST.
> >>
> >> I=E2=80=99ve been testing it locally based on HPD refator series, and =
TYPE-C basic
> >> plug case works on my side (although with some local modify, maybe now=
 it is
> >> workaround). At least the IRQ is being delivered correctly now and the
> >> simplest case works. It still need to do some additional testing.
> >>
> >> There is a small question:
> >> When do you plan to merge the HPD refactor series?
> >
> > Would you or your colleagues review it? Or at least T-B it?
> >
>   I=E2=80=99ve given the T-B. Could Konrad help review this series?

Konrad can do that. But why can't the display team review the series?
Or other patches being posted to the list from time to time?

--=20
With best wishes
Dmitry

