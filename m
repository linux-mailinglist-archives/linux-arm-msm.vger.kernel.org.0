Return-Path: <linux-arm-msm+bounces-100878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMR/GmTEymmL/wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:43:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B242F35FE1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C087E3024103
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0183939BC;
	Mon, 30 Mar 2026 18:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lg4mFrYV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e6DGPs4H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B943A3DE45D
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896151; cv=none; b=lrtmW3pSMEzrxbJ6M78D7S7g8LBlxRaqcqqY14S6W2FuSC4qNyeNg1GdEq7TxKF7M2gmvpocgiUvZz47EFIjDva/7IjNtsCfIKao14hJeGdWPIZVN38nKTM1JyLV7Qei3kN5OT1LPVaeziTd5ztqvdhAKysQMdtATr91SrRzQkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896151; c=relaxed/simple;
	bh=wEZylc/vOUG+ypTEQXA2Jh1x+qldW7FIOT9m9zc3voQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWHC7ViC8RDin+dxdIHu7X44Pd4USFpg1jMJ2PVjbONOmyOOi/Q6dKvki2mSnXq2hRRKc+Kc7h3JPLCu4g/X57VsXcLJWbrVtWr+rmyBOiiFzwulQzORU1wX0HFH/c6vCK8Z241pmW5cTURI404Dxvr7F/ulQ7/Kf8saGO4kY88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lg4mFrYV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e6DGPs4H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UH3j8w4013490
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tmSly2krkyEPd3C1QckzdIz2
	IUKLQUpW62wr+IkZxLo=; b=Lg4mFrYVXlfkHbSHjzYG742sLp8Hw8PbBuqXveTw
	o7U+tcLPv3gt3ouVf0nNtzUc+oQB2a0tDB/7h8AIW9t7DUCmi6mVGSYfMRtNTQBM
	rlbXmLr1nN5nMQFlGGnG1LoeJBut5sP41sHthsDK6u9ugV6QfjmhQ6mJtmR2Dm1h
	fGQV66ppZo8A4qNnaxbBHuvA3IF/IeJmiL/I+OhmESb5H9BbUFPGXGHJmme1TQbg
	iUqA2IW8fY8zQawH9rh5/SKWVVbCcoOM26JOdG7Jzb/g1H0Ul3ZGUSt1bn2O1FWZ
	5wv92hzXy9B8Y2T+uuw2V0bTSuVdks569KQI67RrlBxbbw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7regsr1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:42:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50939597b85so123636801cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774896149; x=1775500949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tmSly2krkyEPd3C1QckzdIz2IUKLQUpW62wr+IkZxLo=;
        b=e6DGPs4HZEMZbC5/NN89qa9uEZuHPB+zd8V9jQqu43SXmswz3khvO6GnVSiExw0l44
         GgTBC0ap1TWdYsy0Iv7nPAjQAmLEUmWZ2ekzpdyCf1pb3QU7/C0zd7pAF6Y5SLdebS13
         aI0co537aaKfTsHzVLy1u0wzI5xqdw2EwXRQnBx+hCjYRuJWD8pNttHjgvHc6Cc/oN7l
         iv/nNwCXRXmCwwsrvFxqyrKyLZEztHpYhlP4fkDYyjeCcIbUgjMeLB8cJyoas8TqMpvI
         idC+vy/TkvnIpw+sWIopwqbJqNnbjopn8Tm58byXL3qjGRi0LxyKH1F+t9F5ABN7UH40
         2YHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896149; x=1775500949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmSly2krkyEPd3C1QckzdIz2IUKLQUpW62wr+IkZxLo=;
        b=tOURMrluhzMv9dLNkZ/H+QW66XcKQtYWqne5yaoUQ2+rqcNmpdxi6406fCRrvjcBI1
         g5BHaidk/ktGX7BtktVhwN+WrE/laB5+3osRX129XeLoFG4h5hiLHs3KS56kP9avuDeQ
         j627xyLtsOLBO3MiCaL74WUfdeBOlummxSzM3KAf65+vq5Yz0mjcGkdoK2342gvYQQte
         qx2S+q6B2MqBXuVaQ10GlhhgPZH4U+3e5oC6BFeCJWoBW0oMuMfJIORUu9LDrqNT6wsE
         wKgC8CYi45XOXcVM0pvDYMkfsuz6GFd4Ke3e3jVJRVs0TsJ8AaGDeFZJ2KIOHepx/Gl8
         vjIw==
X-Forwarded-Encrypted: i=1; AJvYcCVvieJcfGXl0U8OMa+MNxmBEX/thp38AsL8plRjazuZ+1XW5g1TaK3gJ4fWv6mcMKmeHa2453SI/YwWci8G@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq7IEX803eyhJ4geKB9leSmyowjT2hQDXbh0s+PDiT2lM+jKwY
	4xC+tyG5txa60JEQboajSkVLais5kWxuU1LYckV7yceN1RW+pZvrTqQLMw7KTNqrQpzhIADoP3X
	eU4/cbq7CdnzJ2EiRg2QeaVtLPvtywtrbMA4pAPFXLjeUPo2VDtGVsqcTEjIWIQysorxo
X-Gm-Gg: ATEYQzyomZdeAKo5gWQmxrrPGj+XugKTD+eE3XRheBN5Lff/h4j6guJyBuy3jPWwEZ9
	wVX0tAXd0LjjkGOZAbsvAT6PE76pLwFMTvsZHocCGv9rL/df/lBhs2fL5YJ56h+RXsuUqVRunRU
	W2qwhmKqf0fwHguznJ0E6PnWgddUHXHwICkRjoyIIBGMfWB+PY3TLmoeNtJr5+iK98/AAC7UL5a
	dwjk1lavSpjTHCRqCMM55/sssz6DGYwnVazmRd1CSlCjD29OyxclFJthPIR6oPdasZIkRexKcGL
	uuN7MPuGA9EinV+XiuctLg6KuSc60vHUxDModhkUmbTuJn1jwx6xHS+eBExZ5M3Ce19TWm5cf41
	/cQ7624k2e8hINuGZqx2GIuXfiiJqHrnzm4Xii5JbSqXLqIj33NpDRrJAKrdlXNDDdiksSwMVY+
	HFfiLGangFB5AqB6855QnR/ho6qEgrBNHMRV0=
X-Received: by 2002:ac8:5914:0:b0:509:172f:bd5 with SMTP id d75a77b69052e-50ba380a2bamr194037941cf.4.1774896148911;
        Mon, 30 Mar 2026 11:42:28 -0700 (PDT)
X-Received: by 2002:ac8:5914:0:b0:509:172f:bd5 with SMTP id d75a77b69052e-50ba380a2bamr194037551cf.4.1774896148325;
        Mon, 30 Mar 2026 11:42:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f435bsm1815809e87.9.2026.03.30.11.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:42:27 -0700 (PDT)
Date: Mon, 30 Mar 2026 21:42:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Ritesh Kumar <quic_riteshk@quicinc.com>, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev, sean@poorly.run,
        marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mahap@quicinc.com, konradybcio@kernel.org,
        mani@kernel.org, James.Bottomley@hansenpartnership.com,
        martin.petersen@oracle.com, vkoul@kernel.org, kishon@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        quic_vproddut@quicinc.com
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: qcom-edp: Add reference clock
 for sa8775p eDP PHY
Message-ID: <yex4vskdbtvodzkkxbs6yxkeiz5bb3x32f5nx5qklf6oyexroq@zspg26phklt2>
References: <20260128114853.2543416-1-quic_riteshk@quicinc.com>
 <20260128114853.2543416-2-quic_riteshk@quicinc.com>
 <gurq34svc5p52bqx5qwkgjmschzcbklmssjzmu2tg5wzgppkft@c6nrw2ageyp2>
 <c77ff64f-57d1-4495-bfbd-986644aad71d@quicinc.com>
 <acqGFwaVFQ3ZNmlR@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acqGFwaVFQ3ZNmlR@baldur>
X-Authority-Analysis: v=2.4 cv=G6wR0tk5 c=1 sm=1 tr=0 ts=69cac415 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Ns0KfnHm5iy1vUwMj8cA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1NCBTYWx0ZWRfX4cynYvH/lo/h
 ALwEPVI6UErJjDj1qXPCMI7cx62+IMmD8Bq1iijDeaaiJDOQZSzpdABXIV9xZF+TRP4gOoMSjo6
 fapkFE7IFf3lmqdOjy+Aa0Kbl+aaVFxn/ps6Secrq68/ULVcZ/D4ST/1vcc/KgXzb6zM4SWoUNu
 wFI9eYcng454LLoYrfqiB0MT8evnkZf7K9N6aViHo0w6NdN/+M44i8Jh9NsIsQcv29uD5lL8vem
 VRCaB99jWTXdwCLnPQZ+YYZRWxZvHCu/Ej5dYcxl+FqwWk4ZactF0SCtm3UbTEDGtx3KMPNLXXv
 lPOF12ZImDFuIk55m+4fThKcsWXEGorep3dsyNZcIX0ebnXb6jh9LCbliYRHi5fpsRnGMUA7uLl
 gpQEjHietjF30On+8aUIlJWgDUxj7P58SDqEMAVazVY5Fk+G5ZcA70GBt7lYXzEzofe7NOoeyNI
 ekNjULWYVeRuZ2YapPQ==
X-Proofpoint-ORIG-GUID: mBLvH4hTzWffNHtwNRbnIqRlGmiKPd6-
X-Proofpoint-GUID: mBLvH4hTzWffNHtwNRbnIqRlGmiKPd6-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300154
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100878-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[quicinc.com,oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,hansenpartnership.com,oracle.com,chromium.org,lists.infradead.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B242F35FE1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 09:28:40AM -0500, Bjorn Andersson wrote:
> On Wed, Mar 11, 2026 at 06:37:31PM +0530, Ritesh Kumar wrote:
> > 
> > On 3/5/2026 12:27 AM, Bjorn Andersson wrote:
> > > On Wed, Jan 28, 2026 at 05:18:49PM +0530, Ritesh Kumar wrote:
> > > > The initial sa8775p eDP PHY binding contribution missed adding support for
> > > > voting on the eDP reference clock. This went unnoticed because the UFS PHY
> > > > driver happened to enable the same clock.
> > > > > After commit 77d2fa54a945 ("scsi: ufs: qcom : Refactor
> > > phy_power_on/off
> > > > calls"), the eDP reference clock is no longer kept enabled, which results
> > > > in the following PHY power-on failure:
> > > > > phy phy-aec2a00.phy.10: phy poweron failed --> -110
> > > > > To fix this, explicit voting for the eDP reference clock is
> > > required.
> > > > This patch adds the eDP reference clock for sa8775p eDP PHY and updates
> > > > the corresponding example node.
> > > > > Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
> > > 
> > > Is there any reason why you didn't follow up on this patch Ritesh?
> > > Looks like it's ready to be merged.
> > 
> > I was waiting for patch to merge as there is no pending comments.
> > 
> 
> It's been two months now, if you want your patches to be merged please
> show that - ask the maintainer for a status update, ask a colleague to
> send a reviewed-by...
> 
> Perhaps the maintainer lost track of your change?
> 
> Perhaps it's not clear that the change "need" an Ack from e.g. Dmitry
> and then it should be merged by Vinod? Because you're changing two
> different subsystems but leave it up to the maintainers to figure out
> how to deal with this...
> 
> 
> Either way, show that you want this to be merged, don't just wait until
> the situation resolves itself.

For merging through linux-phy:

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Vinod, please pick it up through your tree.

-- 
With best wishes
Dmitry

