Return-Path: <linux-arm-msm+bounces-109585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGswJIwJFGrVJAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:34:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7D55C7D02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:34:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9179301876F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 721DB359A9B;
	Mon, 25 May 2026 08:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WX053d1Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TVTCQaWv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059363C343F
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779697857; cv=none; b=XBBLMlXAMrrbE14n9PNT2vEFXj2dMU+uj15wtXp2T6eqP58QtrAB/glEJgmPltelwJn0lo+PezFyK0LtVDvZxMyXlVj2RAW6UHM9FismrAWzApIfT+o33UEdzDjhxUivitFRPQcIOQpw+i9Fqm8e0kJtqpnX4Lg93afA/EIG2GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779697857; c=relaxed/simple;
	bh=IpyQhDH9rtPmFwum87NKiS0xTIZqjsZWJftfOXXUzo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIqkQO4Tzcrv39zQUGC5Qh/cSS/cfrJpUXUsLEPJWoFuY2TT8kUfpQYmCfYZfeZ1z7WSa3hMuvaB3wwPgu0GFY+uT4YglB/7X8KMGALRi4w2WfK2BPNANZP3SDmgxnKmWGxsTIdI6wImLvOJLVc71ELnVkBp6Iu+NsYd2Y/bpHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WX053d1Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TVTCQaWv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P70YAq1688066
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eGql5wxVNnnYcdxmviTrasFo
	Jka9bNC8wHetOEqs+pk=; b=WX053d1YypNgIOAyPV3DSbN02IbQIuWMP0tVPYHf
	TB5g2KdsFy7r7/PPIMv3CY8dtcKEFzDvrfbhXVqkLKq0qiqjdBU3h1Oc69xSFZ8r
	/iuK/i2Z6iXNEMCKuzroJspCEchlsu0PDoS3miqNQgisfgAPVx89KtonbsPS4+CH
	7gInSjT/jj8AKtPH8lmwhqsmOpLzgMVyfCPVH5sK8svnOw/TO18lF0VkTt825fgS
	LMIVF+fJdesifTJs9pniFgfA2YXDnCCJ0saQajQG/swPh1ZV3x+JMEzSnO8oPZ1x
	YtilVN5niXsyQBOEbbJ42+kM4Us/Jf964+CuZ+LhjaHgJQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4aswtmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:30:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514cbe73d00so269289591cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 01:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779697854; x=1780302654; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eGql5wxVNnnYcdxmviTrasFoJka9bNC8wHetOEqs+pk=;
        b=TVTCQaWvFTcfBF+1RXrp4Q99f95qaQo60upT9M9o42DyrYSYe67s6b4q8eBpRxTWft
         YxKQGmuuh6wj4rdOtcKZNveodxiBqX5MTq5RCQuNvp5J80oJOVOqdJwerIX84atqXLr4
         V7sJkmjOL3L1SoVlvuwjdVyQEYwb/HLEaZ//pAb4TrQ4akhVmw3taAtcPw6dsEKD9VZF
         eY3uB7C5FadiVevJ+JDTczbMFYUZ2DtmB/4/nbVTZxK3eHHFt0twU73PCNN9hkQLFfyc
         rgKwdMpgwM5ofXdmRLNDTHixOhFGd0aPGd8MD1NT2V2dee5vvDgpLyCiWBdg2Dhqxdxk
         lsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779697854; x=1780302654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGql5wxVNnnYcdxmviTrasFoJka9bNC8wHetOEqs+pk=;
        b=rvLbN13qzKw1Rtp+7U6dhfF0v23IA5Uo5csKJsH4Q5TuITDUgbiWvworRhBvtP4Dau
         jzg4KCdc5KjIUhq3OffpZfwsRMAmW0MgQewk4Trxv+5dhBA7htQSN/7Yyn70va6+HkRn
         NKUhBqDTPAgZi/y7/N9FWDzLtuN/Z7DLpK3hfJl2fbmXG+FmhxezEGBoOv4Vin4lHRNc
         L/ZMn9yynxjlv3SFuUoHcUHmVXeTYIrcJyM481g1fncLR2Uy+96UtwsD8qzLSu2oUBle
         a5iW5dcyAiK4jPEkcLYTpBdITHW3YZLzOIbz3F2Llb/qV4KR3jVOTg1dJL4WThLqIvn1
         STYw==
X-Forwarded-Encrypted: i=1; AFNElJ/HgBOFx9wvdPr9QsonEy+mLPeZAJhR/mqgA/+Ur5TvgL+prd2rjfZk1rMqKVJyt8DrLkI/uN4Vxu3jiRJ2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx70wgddfvmcl254SVi4ksUFjV8L+97Gh+wO1aMpYWsC47gLYgY
	/cpiWvMhJJxE98+H0cM7SGxXRA68aCMdORmP6aOnQQxsWzp+z5Fb6t3cMp+YhdMmarBwhGIlxel
	CqnmnNssDyO9YEpxLiyaiAK+9V1lZTCv9roc6/3QVRQUjhtV/s4ULDb9t9SNNDpgfKYpN
X-Gm-Gg: Acq92OGEdpTzHn86UY1hn14o2aGvOBEIUDlzAh/uCbKD8Ylbm2vqq7BGrxsMHXQm81C
	nYHLUlt001NAqVDE/ZtaTKxqKLOjY6m/6HCQ2rMcokn7n/WB66y/vXFO7Kwtj+duXhynifmOdeW
	wsjWAcy4GfIcU4alZClH6xl6gXyN5Enuv9op10fI+ohdNLXkJmo7VUTmUnbGrK4ggeYU6/E6/dp
	GzJIFbPXUpg3fwY+zq1xTOswyaMufVf/qT4JXxrKxeWs51sdDCylOy4SYekfU+xILyANrf4UyWo
	7HJPl/Gsvf0I1fQ6jczRmezRYC4wVUd2/cr2J9CgT7VuwNGxT+A/5C8UjTeW39cuexQUqF/fGzS
	QT9SdPDIe7m91hGI5yebtN+5WJ8JAQlEg0+6PTf3WQQM3hoEcdqlRSmYs725rFSyeu3FluMnubk
	8iXFeR+26AtiqTAicNO87S8u8DKyi8ihcTy7M=
X-Received: by 2002:a05:622a:8e0a:b0:50f:b978:82e9 with SMTP id d75a77b69052e-516d4409d8bmr166291711cf.14.1779697854300;
        Mon, 25 May 2026 01:30:54 -0700 (PDT)
X-Received: by 2002:a05:622a:8e0a:b0:50f:b978:82e9 with SMTP id d75a77b69052e-516d4409d8bmr166291431cf.14.1779697853849;
        Mon, 25 May 2026 01:30:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc0a4cdsm21731631fa.19.2026.05.25.01.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:30:52 -0700 (PDT)
Date: Mon, 25 May 2026 11:30:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org,
        abelvesa@kernel.org, jorge.ramirez-ortiz@linaro.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org
Subject: Re: [PATCH v5 2/5] misc: fastrpc: Remove buffer from list prior to
 unmap operation
Message-ID: <lvfwkplrktjldbvn3j3jqh7ds25prx723at5t5oobsvhgolngs@pme6jiac5xdg>
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
 <20260515124217.20723-3-jianping.li@oss.qualcomm.com>
 <xnkycubizpoe4rmhc3jt36ulx2fb3tubjybu3djovafkqqttmc@o6vw2so5ctxr>
 <37146a3a-b18f-40f1-b95b-0ac19bf6c07a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37146a3a-b18f-40f1-b95b-0ac19bf6c07a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA4NSBTYWx0ZWRfXxqZ5EsRNgx5T
 ZGULpVouGXHFMaO5cY8Ju++OKohaA8t9S845VV+CLbsT1bRp4Ca5TewHqCGZ9hSXwvUt0Ow2k+M
 XTan4mPARuts4lQUdwKDFtGkpK7KLE6aIs3Cf9sYBTSHFJyNcr8z3m3p/o28VsHKudxj/xNVxqy
 M75imsIe3kermWOCriHE3X9sRGG2KEtypEpBysQdUh2ucRkKfK79x4GtGw5jHyM2GC7hVklfhHQ
 Vg1r1lJgzswLgaWJAsFik5HnBMbyYftJtl1uPwtZfkVoto6rbcJkVaFSp+PsPSXQ64eiZEfusuA
 4I1uYsM0ZsCpEHCU61nge27WH6gNkmksevzjrTqcKBFazcM7RtKTW8RS4sqKH1X4iUg5MvXnhud
 CyXxmcHnoGi+C/lazAu81L1Gb9LKRMOH1CeZRkoz4GNT7SXPmQQL1JFw4JluhEFUjNR2gzlaSTq
 ij2DJYsdy7N5dSZgelA==
X-Proofpoint-ORIG-GUID: UBYQBtTJhwfK3hR-I6i05XfiZl2do3tu
X-Proofpoint-GUID: UBYQBtTJhwfK3hR-I6i05XfiZl2do3tu
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a1408be cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=RUoLUfHmO0A8xNlmPTIA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250085
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109585-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ED7D55C7D02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 02:55:29PM +0800, Jianping Li wrote:
> 
> On 5/15/2026 9:36 PM, Dmitry Baryshkov wrote:
> > On Fri, May 15, 2026 at 08:42:14PM +0800, Jianping Li wrote:
> > > From: Ekansh Gupta<ekansh.gupta@oss.qualcomm.com>
> > > 
> > > fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
> > > getting removed from the list after it is unmapped from DSP. This can
> > > create potential race conditions if any other thread removes the entry
> > > from list while unmap operation is ongoing. Remove the entry before
> > How can it remove the entry from the list?
> 
> Multiple threads sharing the same file descriptor may invoke unmap concurrently.

=> commit message

> > > @@ -1898,7 +1897,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
> > >   		return -EINVAL;
> > >   	}
> > > -	return fastrpc_req_munmap_impl(fl, buf);
> > > +	err = fastrpc_req_munmap_impl(fl, buf);
> > > +	if (err) {
> > > +		spin_lock(&fl->lock);
> > > +		list_add_tail(&buf->node, &fl->mmaps);
> > > +		spin_unlock(&fl->lock);
> > > +	}
> > Is it expected that userspace tries to unmap it again? Or why is it
> > being added to the list?
> 
> User process can call unmap and fastrpc library won't call the unmap again.

In the other email you wrote that the driver can be used by random apps.
So... what happens if userspace unmaps it again? What if the userspace
_doesn't_ unmap it (although you've just readded it back)?

> Fastrpc driver will free up this list during fastrpc user-free.

-- 
With best wishes
Dmitry

