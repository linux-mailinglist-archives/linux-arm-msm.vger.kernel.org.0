Return-Path: <linux-arm-msm+bounces-118549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ge7oMNd0U2qbbAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:04:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CE774475F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:04:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fAyl1jor;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=V++OsYH6;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118549-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118549-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E92F43002122
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 11:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B75399D0C;
	Sun, 12 Jul 2026 11:04:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1925F2DC32E
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:04:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783854292; cv=none; b=TRFM9dxiTTDL+nB/mb6wleUgt7uMdPFKhpwvtA38Bo2286kIDMyLqv8W54UZxTnlU1Q1wmtThUhDyjyTmiMpbmPQwUFmeruS0Q4ITUHHaL+nwY/WilSxd1K94Ut47KmRjmpVr4bQRadjeUUbR/tXlmWnMWX4cKqJj7AQxOf0VqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783854292; c=relaxed/simple;
	bh=m7cgPJ6w47p7Tfoc0sTO+4AZm4CQcouGAIx9Fj3d078=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=in3eNgIHv2Gg6G8ZzPZLhigeXtRDI+C8JoxxYL1yy13I6vefDoekqFZpOPUGh0lbdmm9qwZUM6u7ZvexIzNQ+5jzeCT4+IzqWgQnwBbFusuEN+3GmlovqU7kKUWGjev7OFLd5Fruyd42EBHw9hSTK9mFfwZY1YbhzCo8N/sHKeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fAyl1jor; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V++OsYH6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CAc51x2370765
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6R0OOCRGkQsTGfteKAi8Ys2WtC4WWrGzPgJH4zpJa2U=; b=fAyl1jorXPHn+mdP
	cvGCjlF+d45uiSLH+o90aoziu9NyvQ3S25eWIuNmbKaecGfOAys+3EPhAU+rm7UM
	tHUKMvIN4wn76a5REWYHM52Tb3Tav0N8qx60vpYpXDHHV4Cdk+QUIcixPbyWkGKa
	T1sBi9QqucJewcAmc34AXYrd1WwQ7vAEAB0J5UjvJJRh7WCwybgI4qxMPKpzLmzD
	YVcLaH2jguPbm44JdS+nodDinPBzU0CTw+XgTpoubEQbXAaB3Vaq4QZOIyRoG17U
	3cIKD+luSgHyfjMq5MsXUEWkIE6flKpypNH7aBBJSofsxtHAUtqdNz7BD0tkwgW+
	9jzOYg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbebr2jf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:04:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c2af04aeeso32676151cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 04:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783854289; x=1784459089; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6R0OOCRGkQsTGfteKAi8Ys2WtC4WWrGzPgJH4zpJa2U=;
        b=V++OsYH6COKjfOBYEYU1MWkI7mJ3OT5Ap6TMGREZLdyCBtDH+3/6JSy00IB4L925PY
         mrRdzRU6UjxFFyYSTegS2nfzNyBhtITKyIpU1dIyf4ByD3StbgSwpxw56T0rGS/osKZo
         7X+CBUamAIVYUDL/lloIcOkoDLpC/XVUWD3we/2EVWSlybwsjU4AFpsEbQOcXhsbuxKa
         eZVbUUCfu3CwuthlY/jGBDRjyQZCKAI+GyINyFAiKow/F0dVp2fV8q7VKmdc5KlM9p0s
         YWhw2Gp6Rq3pVwNe+lauo667EOdU+gWYyiZyEHGysWgwTWua3pqK+NLdwXYkG37+laMP
         d7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783854289; x=1784459089;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6R0OOCRGkQsTGfteKAi8Ys2WtC4WWrGzPgJH4zpJa2U=;
        b=p9+1N6jMmUBXA7TM2D9LLO6tQk5SKJRzicVd9/zhNg0MCb/dqeYiD1Bg0Dre7biVx2
         QmapT2wztHyh0KhC92XPWdxlN7spQAaZnbH2NHxpQL2JEiC6IJf2SzPdReDbQaYn3yXT
         8zjERHkC1pc6/ZwZpaYU0BHQaZBpEAivkv5j7jYpbdNPqZv1Nl2YqcZarg9rgldFdB9m
         6fpmJ5hYP1kkZQXE7gF71bIPqjKj3LiVaBdlrTbh2tR+5fYxzAn/xilNybNXoirugODE
         cdkaRpQxr6tyhdQGGMmwGpXhs4Cf0m7j0jxJvIPQ8ggcHXCb0ugGvCf82/+y0M5rcIJT
         VX2g==
X-Forwarded-Encrypted: i=1; AHgh+Rqn6SZBukO6tBDMjcEdbGYp4n26h1sCzx5tuKW+HqH7mU81fZm0J8kfBJSVYpLvfSVKBAJqOzFZ2i635VSv@vger.kernel.org
X-Gm-Message-State: AOJu0YyGLZixkTKdQDZrLJzMrKWT++oBAO4rBdQXFtqvKatxyucQbJab
	C45qxSStwpEzHt+xelRP+cr+hFmCjgLd3sCMCqfVrOv75qgPq9mIkqPg8+RoEyC73cR/xdMxKND
	8pB+0nTNc/dNcblOmqwTanbbexJzBXB/M4CWVdP5W4lKZcvsi1n6V5/68Qnan9YVVYuzT
X-Gm-Gg: AfdE7ckzfnnC7fsHX3l/Bq6+FcoRVwwfeiMOTgUPHE5Z4QBjEOb9aQtpChoJi7XGQXB
	sjFcDC9NsOTzz4wtS4xGLoY+8gaxS0ehrYT3xHF1y4orDCo1xQaFA4YyR9aGyGiIyl2aQsEbiUh
	n+FAdkSyZUoeoqhgP2S+jeYXJL+L1B5f+pWi27qdhcNDjVyMst1uYlYuzKjEUnbOOGvWczU1oLU
	SWt44t6bHgn6GQUIHszjIhbegxqRR0kKpErhYhjcKY0gnVT/NW9YgFsu/4hdBvy7NDnKoXKtvLK
	gtDbtAxFHuAJFOFID9X1gVHFuse0u0r1dtiBLNcZSHJe89dZ755e1sC8MM70iPcO4oEkKaiJx63
	EKcxeCfVLqcebBdMVvHbZLHFMdhK1EG6OG2Mrivg0EU/OHrqiBJgnNpznhrktAUKDyOd8QfwJ23
	HI3+0g/4sb6kUQc9n3PATUEkGN
X-Received: by 2002:a05:622a:654:b0:50d:a8bd:dc07 with SMTP id d75a77b69052e-51caa173607mr97392271cf.35.1783854289138;
        Sun, 12 Jul 2026 04:04:49 -0700 (PDT)
X-Received: by 2002:a05:622a:654:b0:50d:a8bd:dc07 with SMTP id d75a77b69052e-51caa173607mr97392011cf.35.1783854288630;
        Sun, 12 Jul 2026 04:04:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa66cbsm1987000e87.61.2026.07.12.04.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:04:47 -0700 (PDT)
Date: Sun, 12 Jul 2026 14:04:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH RESEND v5 00/25] drm/msm/dp: Add MST support for MSM
 chipsets
Message-ID: <vd7njp6lg3yzydwtqmaepjt5kik2akqfcpe26faowvu65pfkow@bieyxaivjcqz>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDExNSBTYWx0ZWRfX0w1yCAP/FeFF
 RhSIV/3Od3mvNml/SXQRXCaE4jY3JjeIXI4rk6n9gVJS8QrxooJdu9hMguPUQA0jdTxlJz4DE8q
 tPPMMQj0J/I5aKxUwos3BmO6n7s119Y=
X-Authority-Analysis: v=2.4 cv=OK8XGyaB c=1 sm=1 tr=0 ts=6a5374d2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=hGJ6E78ypFDi0kfIIToA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: IjXWSefn9JwpoumXfAcC4mYv12maBjv7
X-Proofpoint-ORIG-GUID: IjXWSefn9JwpoumXfAcC4mYv12maBjv7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDExNSBTYWx0ZWRfX6uKmqQPrdC4o
 zqoB06BM68sKcGS00Jml9ZrvkugGx0aNOdIU+Ui0YkC4Zah5BXNWt49DkYl8wsdD3v3I3M6dWzw
 ifHwtM4A8tXraRFxWRdttb4+qxXm84D0MLHt+AXEiYJy1AvF83l7kP/d6CyEvyDjUXaMt69I3DA
 WEkhzxs76Rc7IabXrJwLz2vL37Mf4/s3OD1hsRPSp/UaUR2gDvv4L35fCzC2didaANUb9Pt34TL
 u3ZBVMdmUFwrOoVMUpZILNa6P+R0GajaNENhVN2UEs97TL5QxqIyRiziLWzf3F0TQaSAB0Th8+j
 RGSkFmGYgljrkeO6xhPGU3c9wLfeRULS95iqsvThLXYpb1q0n96eUGoQnf9YztILOCeN5whYUkh
 5eTmrW7w6grSDPGo8qFHR/G/MkOiQM8iITIh1kjTr74YaIdV/BlwiTR7lwq/w6O5dlxb1h791Re
 6qYiAs6vcIFiLoHk2yQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118549-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,quicinc.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 20CE774475F

On Mon, Jun 29, 2026 at 10:14:21PM +0800, Yongxing Mou wrote:
> Add support for Multi-stream transport for MSM chipsets that allow
> a single instance of DP controller to send multiple streams.
> 
> This series has been validated on sa8775p ride platform using multiple
> MST dongles and also daisy chain method on both DP0 and DP1 upto 1080P.

Type-C?

> 
> With 4x4K monitors, due to lack of layer mixers that combination will not
> work but this can be supported as well after some rework on the DPU side.
> 
> In addition, SST was re-validated with all these changes to ensure there
> were no regressions.
> 
> This patch series was made on top of:
> 
> [1] : https://patchwork.freedesktop.org/series/167458/
> 
> Overall, the patch series has been organized in the following way:
> 
> 1) First set are a couple of fixes made while debugging MST but applicable
> to SST as well so go ahead of everything else
> 2) Prepare the DP driver to get ready to handle multiple streams. This is the bulk
> of the work as current DP driver design had to be adjusted to make this happen.
> 3) Finally, new files to handle MST related operations
> 
> Note:
> Validation for this series has so far been done on the latest linux-next
> on LeMans, covering both FB console and Weston.
> 
> Type-C MST support will be submitted shortly after this series.

You end up introducing issues which are fixed in those patches. The API
changes might need to be submitted separately, but the rest should go
through this patchset.

> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
> Changes in v5(fix comments from V4):
> - Dropped early refactoring patches (v4 01-12); restructured as
>   "move link-level teardown", "factor out _helper variants", etc.
> - Dropped v4 39/39 (platform MST stream list); use DT pixel-clock
>   count instead per Dmitry's request.
> - Patch 02: Remove artificial max-stream limitation check.
>   unify register naming (REG_DP1 vs MMSS_DP1).
> - Patch 05: Calculate ACT wait time dynamically from mode parameters
>   instead of hardcoded 20 ms.
> - Patch 08: Replace start-slot loop with direct math; fix commit message.
> - Patch 09: Add locking annotation "Must be called with
>   msm_dp_mst::mst_lock held" to msm_dp_ctrl_push_vcpf().
> - Patch 17: Rename prepared flag to link_ready.
> - Patch 22: Move drm_dp_mst_atomic_check() call into msm_atomic.c.
> - Patch 23: Replace bridge-based MST DRM model with encoder-based
>   approach; remove redundant bridge layer between encoder and connector.
> - Patch 24: Add drm_edid_free(); add FIXME for bpp negotiation.
> - Patch 25: Use dp->plugged flag instead of link status for MST plug path routing.
> - Link to v4: https://lore.kernel.org/r/20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com
> 
> Changes in v4:
> - Fixed most comments from V3.
> - Rebase onto HPD refactor V5.
> - Fixed casing/formatting issues, for example: “mst”.
> - Drop .mode_set() and set_mode in .atomic_enable().
> - Rewrite commit messages that are unclear.
> - Use the same API for MST link and SST link writes.
> - Use the new drm_dp_dpcd_read_byte() / drm_dp_dpcd_write_byte() interfaces.
> - Remove some unnecessary payload fields from the MST bridge.
> - Remove some defensive NULL pointer checks.
> - Reworked the patch order to make the series easier to follow.
> - Add support for more platforms.
> - Link to v3: https://lore.kernel.org/r/20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com
> 
> Changes in v3: Fixed review comments from Dmitry
> - Fixed lots of comments from series V1/V2.
> - Rebased onto next-20250808.
> - Rebased onto Jessica's HPD-refactor branch.
> - Fixed formatting issues in commit messages under changes.
> - Removed unnecessary one-line wrappers.
> - Relocated MST-related .atomic_check() calls to their appropriate positions.
> - Removed the logic related to slot checking in .mode_valid().
> - Link to v2: https://lore.kernel.org/r/20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com
> 
> Changes in v2: Fixed review comments from Dmitry
> - Rebase on top of next-20250606
> - Add all 4 streams pixel clks support and MST2/MST3 Link clk support
> - Address the formatting issues mentioned in the review comments
> - Drop the cache of msm_dp_panel->drm_edid cached
> - Remove the one-line wrapper funtion and redundant conditional check
> - Fixed the commit messgae descriptions of some patches
> - Reordered the patches and renamed some functions and variables
> - Link to v1: https://lore.kernel.org/all/20241205-dp_mst-v1-0-f
> 8618d42a99a@quicinc.com/
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> 
> ---
> Abhinav Kumar (19):
>       drm/msm/dp: introduce stream_id for each DP panel
>       drm/msm/dp: introduce max_streams for DP controller MST support
>       drm/msm/dp: Add support for programming p1/p2/p3 register blocks
>       drm/msm/dp: use stream_id to change offsets in dp_catalog
>       drm/msm/dp: add support to send ACT packets for MST
>       drm/msm/dp: Add support to enable MST in mainlink control
>       drm/msm/dp: no need to update tu calculation for mst
>       drm/msm/dp: Add support for MST channel slot allocation
>       drm/msm/dp: Add support for sending VCPF packets in DP controller
>       drm/msm/dp: Always program MST_FIFO_CONSTANT_FILL for MST use cases
>       drm/msm/dp: move link-level teardown from display_disable to display_unprepare
>       drm/msm/dp: factor out _helper variants of bridge ops accepting a panel
>       drm/msm/dp: replace power_on with active_stream_cnt for dp_display
>       drm/msm/dp: Mark the SST bridge disconnected when mst is active
>       drm/msm/dp: add an API to initialize MST on sink side
>       drm/msm/dp: add msm_dp_display_get_panel() to initialize DP panel
>       drm/msm/dp: initialize dp_mst module for each DP MST controller
>       drm/msm/dp: add connector abstraction for DP MST
>       drm/msm/dp: add HPD callback for dp MST
> 
> Yongxing Mou (6):
>       drm/msm/dp: add link_ready to manage link-level operations
>       drm/msm/dpu: initialize encoders per stream for DP MST
>       drm/msm/dpu: expose dpu_encoder ops for DP MST reuse
>       drm/msm/dpu: use msm_dp_get_mst_intf_id() to get the intf id
>       drm/msm/dp: wire MST helpers into atomic check and commit paths
>       drm/msm/dp: add dp_mst_drm to manage DP MST encoder operations
> 
>  drivers/gpu/drm/msm/Makefile                |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  40 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |   8 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  30 +-
>  drivers/gpu/drm/msm/dp/dp_audio.c           |   2 +-
>  drivers/gpu/drm/msm/dp/dp_ctrl.c            | 473 ++++++++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_ctrl.h            |  17 +-
>  drivers/gpu/drm/msm/dp/dp_display.c         | 394 +++++++++++++++----
>  drivers/gpu/drm/msm/dp/dp_display.h         |  25 +-
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c         | 583 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h         |  14 +
>  drivers/gpu/drm/msm/dp/dp_panel.c           | 197 ++++++++--
>  drivers/gpu/drm/msm/dp/dp_panel.h           |  20 +-
>  drivers/gpu/drm/msm/dp/dp_reg.h             |  68 ++++
>  drivers/gpu/drm/msm/msm_atomic.c            |  14 +-
>  drivers/gpu/drm/msm/msm_drv.h               |  19 +
>  drivers/gpu/drm/msm/msm_kms.c               |   1 +
>  17 files changed, 1718 insertions(+), 190 deletions(-)
> ---
> base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
> change-id: 20260410-msm-dp-mst-35130b6e8b84
> prerequisite-message-id: <20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com>
> prerequisite-patch-id: 1d440cb9fed2bdd66d8de0e1e20475f0fe166973
> prerequisite-patch-id: be0f4b80697df7224c80362b161b8a9f0a542184
> prerequisite-patch-id: eefa6e6353df301420feae1da704a9db2c2155f2
> prerequisite-patch-id: 9e9095f82dd6c131c9f3c1de4fdb8a62bd65ca24
> prerequisite-patch-id: 3e635f008f9b56823101abd9253905f078fcb3b5
> prerequisite-patch-id: e39e0dc124ed043c7a419610ebe03ad105da27db
> prerequisite-patch-id: 945af39213cd4241e1a5929fada04a9286aeb5db
> prerequisite-patch-id: 898ae7e4582a6b31492c223e7dd167fb9ce78096
> prerequisite-patch-id: 3887553893357c1ffbda99eb010801bc2166cbad
> prerequisite-patch-id: 7ccd961fa3c6f925659dee7d7a5bd167c8e7331b
> prerequisite-patch-id: be2bf918e0e87ec2ea999927f36bd172c498748e
> prerequisite-patch-id: 6aacdabb2dd0536dc04da04f8419ae39e35f8b19
> prerequisite-patch-id: a9f27eff8f643ff445810b17d670891928f5b416
> prerequisite-patch-id: efd300a2b52715153b8c1c7407db696eb331594b
> prerequisite-patch-id: 950abefc4862050ef606404977fd27c5dd2cbb2b
> 
> Best regards,
> -- 
> Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

