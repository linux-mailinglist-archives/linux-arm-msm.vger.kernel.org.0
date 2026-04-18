Return-Path: <linux-arm-msm+bounces-103607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLGpF7rd42lrLwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 21:38:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7984221D9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 21:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6959302D087
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 19:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF83B33AD99;
	Sat, 18 Apr 2026 19:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iPZXIwGw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GvFRYeH2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F8B3314C4
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 19:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776541108; cv=none; b=iohJXGlr0sbTXETv3lvDk+rYOlzliSXD4PPqoSyYxzRK4/6m7s1rp/ysk4/kOFoYjzw/jeawp2alKv1HquvyzgqGDcMGEE5OBKM4URuxhmPi1nA8mBDVA6/HVJ/Dj8JAJ7Dc6QyWN86N2uFWfw91KidEwhX3ogZEkLAJIq0M3ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776541108; c=relaxed/simple;
	bh=D9bDtXxW3hYg3zOewGGHaPyX3bjoSoMDKPBs+JVD+jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRqG14zfGpQfCpM2r5sz61XrT4kLo9g3UGtcV3K3JE0/8t9heFx4SlpsL79tCyKmtOBQ3QLmPEAgkBtdH/jzxWSavOiVhdtZZ89gZ6zcV5rnNWfMTvjhcw2RlvhZBSc3I19rw0E15YK6K1nV9Cy4W1T9Q958llokyNe5sQsvv+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iPZXIwGw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GvFRYeH2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4UERu3535976
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 19:38:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kbwvqRx22EuSdW1o5avcOXEZ
	l4XvhLf+30K9TnHpX7o=; b=iPZXIwGw/DRx+Zt91iZVqqLZHLhQfaqwatR2rPg1
	i8q/oA20HMpxH46pXKnyynNMPPH3db0oFL2PK63Bs7E27TI5ymG5qeIbZF5BvULk
	fRL+sK6vkRG52aO4231tZMZp6/iiQg6i5CfN59YvFzpx/VShtp1gXg1vrhaOqV+d
	sFE0aHqta25IQs3krIY5t1bY8CMV3neSQM9FM4XkgLm9RecZM35805nez8FbngXI
	oSi3ULWHzpk6HGHHBH/6wUwPVCfWam5B1MN7PYZg5E1pyeEM7b7ymoyHzfk2d+Mo
	pacK+MXqrVp5Yz+tWcCcwbV9AGMreEJX2ukMqJDehzcNAA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkyanhnfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 19:38:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e423a05c8so21335411cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 12:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776541105; x=1777145905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kbwvqRx22EuSdW1o5avcOXEZl4XvhLf+30K9TnHpX7o=;
        b=GvFRYeH2nJbXQnVmTxae0cy5BJ8CC7+i6hHTuJzCbz2DZFQuqsp6h9lsSypaJ+R+cI
         jah43EYBSdWQPkMBJjUnHE3D3EJz4oShRVHehZgZmrdRI/vh6JqMfaY3/CAUzsagDUif
         odZGQ6ir9XhXkXSZX0iC6WBSmaCpVKaIiO2H59+3lW2cE/HmZl3WtLyBFpiok1/7vgHy
         l65wNvqR2nMICFVuR1Ly0GKJkTSrCUBtAW8nkQLStdyGAp/xHr45qG8f3S12jxNDg0W3
         mknq8FT85rCigmT+2sj++Ytf0n7KH6U+JgqhVR8g0473fOUeLVokq9RNKiQ6jEpdvRYz
         M61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776541105; x=1777145905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbwvqRx22EuSdW1o5avcOXEZl4XvhLf+30K9TnHpX7o=;
        b=cqYD9vAdlCYqIC4Fy63+NO6tn8eBQxuK0FDYCPdg2e2PVo8bGcNREVmf0XVYDDWpYy
         DvwHgrxfVGhpAtNqzeOOssUZbAK47WZ2Bie1jS9PwkkrCl4GXmPDe2XKrt4ZmSoMLcZJ
         5AUpvTRbk0Ntb7sXB2TjY/sNbSd33zGF7eAyaWRfMf8vRpB61WAEdwmX34k3bXT/yF40
         8p0WUeWQZkNvi/wCfmadvZEkDLV1sgLVEXJwEWeCIEu2Vpj8SMTaVUHrFd1Yo4yxU/4C
         qOKiH6rDOaWcgVFefV91ucO5tQ95I+OFLewv+bVlD/YYjrXxnzaUox8Du2CRVC2xqtLs
         +M/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/oont/Logli+2hEy8EswAsBhQv2cwSXbjeX8mLL3OeYZHqyG1MHDY0LO1eNfOMG4YblqYNKtaIHeJXNi+c@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+9FPVXLkc6rd6xTVTHWiWP6C9ls5nVOpeSnNtZJkkCgrM0NJy
	UPVj9e5xGxkZXXI7uKhVMmcKCjkCjQ37D5E9dp0ANo7vRQauJBe5t1R/xZagQmkpQdcBPVH584a
	nwtDOCoHbCojaXUKWdCrrI8Ff7UDmIajGqrXdvLKgUHn3bNs3APItHxROWHPXw8awMNSL
X-Gm-Gg: AeBDietHA5C3h9Yt3Dgb/tkOcOF9w9UXewCnApZaB6K4pwlriHXOufqUj2Fdovr6pdw
	5IYoLsIM6cw+TQcOngXEguhF/rg1xQbjoHn0y6r+tvhh+ntSwn3ffYrXuytZaedFi1vX6seGtaW
	eFxtYqdn6NLcuwQJsHIuM00YAYhHv/dqtPChdp4zOeWofKPVtWjtPoC82g/cnho/z7KD3uA8g0r
	FhVMV5Yr/iRqdKvA4D89CMW5eT1KAOU4gbKSK9y5599rnvxINf0n0BIvTGqLI3yNxCkxZpsW7v/
	jQfOstDh4UMQQhPAZ/9QQovQPRQV2syirRO0NnNB/cPZclMFRrWaqchTWhKcaaDyganoiGPEY//
	p9scrmwjZey6mxJvctF2b7bd8MawccW83H3Uu2PqtHjyw5iRDwqlgEV/juudX5/8dCpc81W/sjF
	Nqy1J2V4O80uFiqDiMz4ULKdXrvcSE9uPT/7hrqjr24cJwRw==
X-Received: by 2002:a05:622a:48c:b0:50d:9c1b:941f with SMTP id d75a77b69052e-50e3661b147mr97389821cf.8.1776541105481;
        Sat, 18 Apr 2026 12:38:25 -0700 (PDT)
X-Received: by 2002:a05:622a:48c:b0:50d:9c1b:941f with SMTP id d75a77b69052e-50e3661b147mr97389461cf.8.1776541105035;
        Sat, 18 Apr 2026 12:38:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7dd0sm1553387e87.69.2026.04.18.12.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 12:38:22 -0700 (PDT)
Date: Sat, 18 Apr 2026 22:38:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/8] wifi: ath10k: snoc: support powering on the
 device via pwrseq
Message-ID: <hdypom3nioc6tk26gh647imy5ykhcjqvknideilnbc2b5p7eo7@hm7fsscleutf>
References: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
 <20260119-wcn3990-pwrctl-v3-3-948df19f5ec2@oss.qualcomm.com>
 <DHUHU7UIT487.139L3KIVRVREU@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHUHU7UIT487.139L3KIVRVREU@fairphone.com>
X-Proofpoint-GUID: rdsoxCqCZORjP81epiX0u-FdcdMPneN0
X-Proofpoint-ORIG-GUID: rdsoxCqCZORjP81epiX0u-FdcdMPneN0
X-Authority-Analysis: v=2.4 cv=SNFykuvH c=1 sm=1 tr=0 ts=69e3ddb2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=Rs7pINfTDodmtXVth3IA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE5NiBTYWx0ZWRfX9hAhXnZlEISV
 BHtFB97VZSf9hKPHgWX3xK/eNwBfjOkF+iGqp2Dbj5YJ2+sRvrI68yy8HQ3pG+7YiUF3peAVJF5
 O0UQj0gvglaZsnrGDjSi2hKXF3PHEqI6/QfPvA9x437R9+hfY+RZiIt0EVg66EZ9uORNHXuLpld
 e/gydsxfxxgy+mO7EdOqRiGA4pfzCqIsQ6/BjHQ78IM41MFsXPnG8bnNeaxx7T6BV2sH1nTulnn
 KiIQ92UsTm+2Evbb78M+zw4bc5kJBFvkRk0jqWelpW2u0aMtYORlKcNKU8WUNwyV1SLMybo2vw4
 DQrY7iIADv2aUXFk4kc7TpR82WWUHUnO+fbLg15pwS+5923HAAQ3WDVxspHXu0tp8iD1n+lxDTc
 gs1+ULOkOS+CbM1YVFzwN/+9eZwDjrz0pIhdB0hUuwRkGWck3P491dtp/RawJFgiwdDgUB6rZsi
 9S6xnwtdsyU2jcEsW1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180196
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103607-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,holtmann.org,quicinc.com,chromium.org,vger.kernel.org,lists.infradead.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,msgid.link:url];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BD7984221D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 12:06:09PM +0200, Luca Weiss wrote:
> Hi Dmitry,
> 
> On Mon Jan 19, 2026 at 6:07 PM CET, Dmitry Baryshkov wrote:
> > The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spreading
> > voltages over internal rails. Implement support for using powersequencer
> > for this family of ATH10k devices in addition to using regulators.
> >
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/net/wireless/ath/ath10k/snoc.c | 53 ++++++++++++++++++++++++++++++++--
> >  drivers/net/wireless/ath/ath10k/snoc.h |  3 ++
> >  2 files changed, 53 insertions(+), 3 deletions(-)
> >
> > +	ar_snoc->pwrseq = devm_pwrseq_get(&pdev->dev, "wlan");
> > +	if (IS_ERR(ar_snoc->pwrseq)) {
> > +		ret = PTR_ERR(ar_snoc->pwrseq);
> > +		ar_snoc->pwrseq = NULL;
> > +		if (ret != -EPROBE_DEFER)
> > +			goto err_free_irq;
> 
> I'm fairly sure this is now broken with CONFIG_POWER_SEQUENCING=n since
> then pwrseq_get() is returning ERR_PTR(-ENOSYS) which is not handled
> here.
> 
> I'm observing my ath10k_snoc is now failing to probe "with error -38"
> which definitely seems to be related, but I haven't debugged it further
> yet.

Posted https://patch.msgid.link/20260418-ath10k-snoc-pwrseq-v1-1-832594ba3294@oss.qualcomm.com

-- 
With best wishes
Dmitry

