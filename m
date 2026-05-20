Return-Path: <linux-arm-msm+bounces-108658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHJcLMF+DWosyAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:28:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F1458AC80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9E8A30DFFE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC853C2762;
	Wed, 20 May 2026 09:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tchpl7Cx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BKi4rG2U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447973C1963
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269064; cv=none; b=D6wfWSqjACBx1QVuCSGvNVY3ATjD6is2OMa5adawTi84q9l1QAmO71oK97inNXzokGHRmOPljcbrR5X0nU9RUl9H8Nco2Yhs2MAGr93ToUGL7nU/lMI1T+TilLtTv+iQxKtWLuBuANQBX31xW25Jvs4XOrWMlPY3x2IdWf81hmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269064; c=relaxed/simple;
	bh=z/yE7zSwFgBayLGq530WW8d6ljDqOlZ3yPR+NVx1hMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHG++ALcbJNSc90zDoCQOhplD8zxHYonG7uZRrTuT8E4k8TxAON9XftpjJoYZyc6IotRDa2RQblasJXKG2FKg0jHcL7tt+ie85NlBGNFuw6fJ4vHv8xqCYMgJwIkxQWLvdI9cFRsGyqtFtLuv++7/S6bmsmh01h8FwofJKwZTQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tchpl7Cx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BKi4rG2U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K77X7C1953961
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eyTiG6S7k3PZK4fzsR0OSDD8
	hW52XV0ZuVhq5LEPl0E=; b=Tchpl7CxZqIJCVXrLPkaquSJp3JJoEQgGHBofOCS
	An2DVyUHD0PFQvZQV7VORhoQMD2XPT/5xbT8h0Pz3IPtcEfNCNCj3kZ+8VK8NC1Z
	rOx2J/6hdXWktoCV+9rnDJrPooLB4DQkZVL1n1pWRZ6bmojZ0Xzc+u34h5Wn3dv0
	mq2jFYZqRpwVgY3fe38+yXsu0DjXzy84YMdjXjmCXUdMGvbBVn/yE+XpclXTiRX5
	NmUmQq5ZJaVQg0fTK42Y+3hLGjz7uqAHp8ICdlBBbbquNwHpjf1Qum7FXcVONU3M
	PUhSbdnzaROXZG+KyQ1tDfNiqSxJLyuw1qVifltQvw4/Ng==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3xv1um-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:24:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5156c85538cso133197811cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 02:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779269057; x=1779873857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eyTiG6S7k3PZK4fzsR0OSDD8hW52XV0ZuVhq5LEPl0E=;
        b=BKi4rG2UVgcH9eP7MyoN7UuKjaNr9vRLjO4sHNSZaEwRdravsdd5VHOhtSJeD3CABv
         fYwxwdFBkSiKzq07NqOnoeWQjRpGUaZfpqYr7R34U4ykd8klcKHWY265IJykp9iYm7+p
         bxS5G9NrN9Ukd77MMukA3/9U328+cX46vdBz14QuFwAfByX/yY7GpBZ3QVp9wQRvWgGj
         /dVW1rMB3PftG1T6TFRL15KVmaUhwABtR7l0y254TMI20Uk38CPC5L5bjP0Z3dq5myYW
         bYs+I3esCS/Uy0wx1jiVQ/mkhUX1sxEb0BrfcYhb2YzX8ppFmDyEqqfKLI+kCS7CBxno
         jNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779269057; x=1779873857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyTiG6S7k3PZK4fzsR0OSDD8hW52XV0ZuVhq5LEPl0E=;
        b=cEi+1P14Z4qqD7rtDT9pnAvu8HB+pWIL58E7BAu9P1874z/E7n9uRdnTwHrFHT2EJZ
         jdHAmGwLVcRZ5fKv/2jVVP499ZPLsvs6nRK7lZe0CTE+LTgh9HNCuV/7ZRo4t0C7k75Y
         gNwToeFCarcihN0qIAnXlEovkRhMTzMn3Pvzx+X+PFr83uKCpzGat1bT9UCWd/QyrdJf
         Mk3QZtQ641f0uDN7NwgKrGMz+TC8/NkDb5CemynMLaJuWISzW1kvzJT4F6hviXEP+3YP
         g9BmTSIkV6nLiQpCDObWZifTzCG7+NSXr/ZtXCivDQFJnSsVx3TU9DPCsOIbWTrtk6Kp
         WwPw==
X-Forwarded-Encrypted: i=1; AFNElJ8T8g9ywsZwENHk5z6a86gAO5ln/xUzM/mK86P8SQUneF1Orr55xwWlph/5uOP/t3FHZZbShTs1rfj4tDnb@vger.kernel.org
X-Gm-Message-State: AOJu0YwtI4SjNWJNj4YqYratHZohxphyWgCr1BerDgdzBXtAjo/S7Rpx
	Q/Ux+VfBZUonsBNi/Uf3smKyU2JmsaRDk/PsXE/nLEYk86oOhSy6f7ebFCdO7LX81pUtqSlp4A5
	0sALD1/bfqc3/yziciSTxUdcXiLBYPCnaDcHyMVwYYjH6UTErD8HmiQ86kKHgzL9pTZUn
X-Gm-Gg: Acq92OHz2hSGlda8TqiGdmhyM57T4YRCYUcc2fEJ0qS0LD1GJxHnk5ONteE3QXb/Buj
	lq/7UvgnrjZBMN3tSl9u8L6ZkUmH8urQIQj0NJljWQ9Uv/JEu1xg/cDx0EsDfmRC3cJqemCaL9A
	8+MwrkKjsUuJmllLCyoK5P0zmVy/pP0lTPvz6mna3XYDTzvP3iJIYra4kxUPuFGOiQBtvpjYHpF
	fjyeWD+jNZbRQrJKY8xiv+B4Qe92vU3MeBmBK7GHSWEjjLsfwbTX7R4mc+VuC0QPn+JkgYcI8le
	BepfrWS3Wh+DHOLXdQSgW2H8rWBcbiTp1p1kBMpk8HF6WcMOcsu220V9T9E/O2n8i0qyNMEJJwn
	4Q2z1ogv9PsFkKMFU3nodE8HKlyZ9oCMuDa9md55uBteRXbf4J1y+3SX2U4JzjOtvVfpLOBRlqo
	aPl65kd7vIiDkwsNNVlGneLPghU/6RqZ07z/c=
X-Received: by 2002:ac8:5ccc:0:b0:50f:b13e:b746 with SMTP id d75a77b69052e-5165a1e4662mr336323341cf.44.1779269057170;
        Wed, 20 May 2026 02:24:17 -0700 (PDT)
X-Received: by 2002:ac8:5ccc:0:b0:50f:b13e:b746 with SMTP id d75a77b69052e-5165a1e4662mr336323081cf.44.1779269056782;
        Wed, 20 May 2026 02:24:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3958874e9casm28093891fa.25.2026.05.20.02.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:24:15 -0700 (PDT)
Date: Wed, 20 May 2026 12:24:12 +0300
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
Subject: Re: [PATCH v4 08/39] drm/msm/dp: allow dp_ctrl stream APIs to use
 any panel passed to it
Message-ID: <6b6uc5lk4tsxccwyyqlp4u6sqsv3x3uyu32qmgl63rgb2m4wuz@wjcroowka3zq>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-8-b20518dea8de@oss.qualcomm.com>
 <oughavmmvruhnehdpa4e3ptigcb4wndugxazhoeg2yed7ubvgi@aa7wtrz5s6mx>
 <09c14a80-d981-4584-b4bb-8fb2430d7a0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09c14a80-d981-4584-b4bb-8fb2430d7a0a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WaY8rUhX c=1 sm=1 tr=0 ts=6a0d7dc2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Z__WNO7T8UARlRF9xIQA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wtEVKQh75XocP8fLc0GD_ZbmO1BRGQBa
X-Proofpoint-ORIG-GUID: wtEVKQh75XocP8fLc0GD_ZbmO1BRGQBa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA4OSBTYWx0ZWRfXz5Xw/qEtuQHF
 sZmWfZaWdvcZkereDSZbAm8I1oEHq9095Xi7k0CdTK1rRuM/GDV03F+VxcXbJm5FDCdWdszbol7
 Qncpc1MdEtDdQ3AeSdcJ4BNA6mscxZYGHZY3J38+y0+Rm1Z9aohq7sgNk2Oee0T75glg5F3ZfxC
 BhIXm37UUbePd0kueJhJW1jOKIpQts4xa00fCx/j7rjL5K9pvDpRbc3VikChG6GWNpxwtwG/LWF
 EJVa6XFcm0UPzmV2jBINbkPbqdjoc0syIExAKaA44AaYnQ92fl95AfW3AVh1z56QCJEj8b0uhcc
 Eu5YhtbiRQk5xNGXFgRRj+LKLmjDYZdi6+AUmTn8Bp9JzLlWFe/G6+AcDKbSoUjvLJzHkaR6cZ5
 oTUoFAcHge63j/MIUbJbWeQkdcA8DncOkZ0PYg6JIC0Vvgo1l+ibP3rU4qiy/W8W7VncoSkvaSY
 tElNjq+mx8AL1leFvcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200089
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108658-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,quicinc.com:email,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 27F1458AC80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 03:52:35PM +0800, Yongxing Mou wrote:
> 
> 
> On 4/12/2026 1:38 AM, Dmitry Baryshkov wrote:
> > On Fri, Apr 10, 2026 at 05:33:43PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > Currently, the dp_ctrl stream APIs operate on their own dp_panel
> > > which is stored inside the dp_ctrl's private struct. However with MST,
> > > the stored panel represents the fixed link and not the sinks which
> > > are hotplugged. Allow the stream related APIs to work on the panel
> > > which is passed to them rather than the stored one. For SST cases,
> > > this shall continue to use the stored dp_panel.
> > 
> > Hmm. Why? Can't we get rid of it (in the followup patch)?
> > 
> In MST, the stream panel is bound to the connector, but in SST the panel is
> still stored in msm_dp_display_private and msm_dp_ctrl_private, so
>   dropping it does not seem necessary at this point. The purpose of these
> changes is to allow the functions to operate on the MST panel data passed in
> per stream.

I understand the panel being stored in msm_dp_display_private. Can we
drop it from msm_dp_ctrl_private?

> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 21 +++++++++++----------
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
> > >   drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
> > >   3 files changed, 13 insertions(+), 12 deletions(-)
> > > 

-- 
With best wishes
Dmitry

