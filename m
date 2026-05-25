Return-Path: <linux-arm-msm+bounces-109586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDoLATkJFGrVJAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:32:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8685C7CD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74E05301474D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C1E3E2AC3;
	Mon, 25 May 2026 08:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQryuBx/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LmUxWFmI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E243E276B
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779697970; cv=none; b=OGdOB/aKrG+wSMO0fPRI7D2Obcg2nThqv3Cyg4k+haoMOxCm9yHLgHyKCAxfuMArkD/3vL7ZIsrlQ7W4vCp9zzMk5H3QX2QvHJTikks15iz7bDcrHb8mZcLEYFm1XAeV84mjg51UuOkmofyg+zR4u40kG1hFLn4uQu7sNN9hsb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779697970; c=relaxed/simple;
	bh=yLksL61ka0OrmorU8+Y+hcTALJ0chmDHx1Eq3gMSuGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=odRug3nFWTfXFG6jOlbsFJZIoWdrOpoxnxlpzQLvxmMjIDFYgizeaRRCv6a3LT7DmnbxQrVqz3BsRZIgF10GD9x+1szgkg92/vEw0ake40KrJ5gu6Typ3DdAbYN8vMTzHDKGdT3eg5sz/KN17s0wIimSxVEABoxai+DNcDw1YcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQryuBx/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LmUxWFmI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7FsiT419389
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a/GH9zMRwmohvMEFGCjJTJbo
	0KhAcstMUoj3XhiySAc=; b=UQryuBx/WHL7xDGPaMEq6obPSvhfHbRmxiEHk/vr
	w99jsVv3T0dptbC54TQCVkTP8GSfeyAqgJW6vRD7C/aqKyeOs1832wNfWQjzzUwm
	bngEh4UjBY60EwEnzkdvZUwCkahIn1N7wvtTOlvjR6tGXfeVjC8ncqWTBm+sFcYB
	5y9x/f7ehSr4lNisnzZCc+wpaufKE3TKNhtoyKthTtt5dWLaL6G0rvFftAb9mtmy
	DCMc4WpACnPWZ1qmSIe8GfjBOLTXzlff6VxyV1JfnjG3aYx/cLRQRhaoz2f5qmEQ
	e6WmIFq4ufF0Ok8FokmSHGWiM0wHfirSpOieB+430AoYcQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb386p0tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:32:47 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95fdb64f843so12854936241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 01:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779697967; x=1780302767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a/GH9zMRwmohvMEFGCjJTJbo0KhAcstMUoj3XhiySAc=;
        b=LmUxWFmIn/2s+0f0nv7jYAjUF3OSNzNzP6zgh4gfrBzmFylFQwyZdv4rVwoLs///+f
         jivKvOy7/WyhcIqc589S0vnBHT+ykjwf/UtVn5rylq5JDFihx4JDhu3z0WJwOstPqKn8
         cjzzvlzYSCuB5RN4wSeUfNECzw9sbriri4JTbDTmHRyc0niriLirhBsBZyV1r4hVqg7A
         3z5YNNIBFbJ7HjveXNuwGT8CxlOpD7hyFNgfviyCEPIUIG4mjFuMR012WXbAkWwKNqPi
         RB/MGdGlO4q/6L6122GhBqb/eypH6CAWttowuf9s2PwsWEVHoA+peuXHK5gFXhP7ea69
         pX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779697967; x=1780302767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/GH9zMRwmohvMEFGCjJTJbo0KhAcstMUoj3XhiySAc=;
        b=Mza7+lom7ZFz0/AfwuBwVxIGoVNEoBQ52WOHSrOc+q4dSaVrewm1eyLA0lpFOIRy+R
         W1/vl8UHW5aQivSKL38pfGghZqlVpfox1uwfVmuwFu+RHTub550tLvwJIEVXaFEkOMB8
         i2yUN2U4JbjxlpgXHMNlVdE2UEctT6D51PSAUGECNmeJmca8oP5vJKQeNcM14KUbg1y6
         nwgAGCS4wCLkJ81z5/BfDu5etet4Rb5HTXefl5PePsnZhoLriCpqBPZg0x1BmUpZNqub
         QacAZxRZnSYCPmfzZMBivuFoiAmfSvF26G+g2zDQs/ML6GBMViIFsUGRQBZEfOz6heIa
         m9oA==
X-Forwarded-Encrypted: i=1; AFNElJ82vMwUHY7sBLfFmmk+3jDDdYMHYwfNMhbnUXBdYJh2FUWdIr2QguSVuLD9/Ci9VLWLdM1dTryDoJeQlp2g@vger.kernel.org
X-Gm-Message-State: AOJu0YzOKtbaovT4sLZvthNUSZOOwy0QrSdpSwTowkFGKj5UySObWEc1
	GoiV5nAo/3Hihj5zP87eHpoc7vgIEXr6E3cJeuF7LWj6moVYnEC+HYA4Hg/wVOMfBsS9Jbui5u+
	giTj3pTnTp1fpGSIzgOVQ4GNKVhr64vU0/+8Mr11QyI9kDIy2YQiPdHFxNjlzIcj8cPL2
X-Gm-Gg: Acq92OEdWENJuyZNIALEkYrcsAz20nWhmOcgdKsDbwFnUjJ8aP/jx/sAWc/8LRrrzuu
	J7+mYPvIVzHMg8lmvuJNYVBTvbqO42EOJ280XPqt4/7T3gYikEW2+p4w6y+uFkC2vNQiZHb1V7q
	fuEwnHqgNZtrLj/PnjroIruHusuBVI7DiJ54Nxlv1eBe6Gr9BaI390ghPLdg5rodhVOOLc5hfQM
	1avPd5kSg0FCsFEnrm/tICIZ0Jj6EbLwnMoWUNuAursQsV1+xZocfNZj6mVv/OPaxMKujGZoteV
	/THsfGPoNf1IzKy+QJEbijexyg+IaaUrKXw7RV9BVm2kUU5wuJdFpLGgz4EVqTzXc88H6HgDxyz
	4ZwTYhJ/U6VRH/839E42frqEEuhTDq4U8VVGEdTOxZJXtXT7VfyrJmGnrAq2Dj9qYGYXnVzzuTC
	4ZzLRm4nji/l5gyTMBkQzHycVbGo3QwlR8CwQ=
X-Received: by 2002:a05:6102:b0c:b0:631:9366:da8a with SMTP id ada2fe7eead31-67c7d973c28mr6988598137.16.1779697967266;
        Mon, 25 May 2026 01:32:47 -0700 (PDT)
X-Received: by 2002:a05:6102:b0c:b0:631:9366:da8a with SMTP id ada2fe7eead31-67c7d973c28mr6988590137.16.1779697966887;
        Mon, 25 May 2026 01:32:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf92c0sm2479515e87.74.2026.05.25.01.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:32:45 -0700 (PDT)
Date: Mon, 25 May 2026 11:32:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, quic_chennak@quicinc.com
Subject: Re: [PATCH v5 4/5] misc: fastrpc: Allocate entire reserved memory
 for Audio PD in probe
Message-ID: <lpsvrgw7spxt34rdvfakxm3trdjybv5lyq2pitnso5k2bfkrmy@7a62dvbmf4r5>
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
 <20260515124217.20723-5-jianping.li@oss.qualcomm.com>
 <v3qkvvqlggrk7thn57ff4tlbilz26nt3nlma6deixlalq74i2k@nbxbqyppzwte>
 <fb00c836-95bc-451b-9430-2ebdf0be2630@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb00c836-95bc-451b-9430-2ebdf0be2630@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: AUNxFlz9zjln9a_YrGElYgoaCyLdRo4B
X-Proofpoint-GUID: AUNxFlz9zjln9a_YrGElYgoaCyLdRo4B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA4NiBTYWx0ZWRfX7saHGhGQTgQ8
 DIHrNkK9BZDLG8T9EtvK0bqGOLk1XXHwcXqaJuNBVhFh62hzkGRl/DnotLbbzVPD+7na66YbAww
 hLCrtixImJ2RBmo4bQoYYhb56rl3HH6s4S9Sp9ZiOrkbIw0Kz4nwoB2K3NfvLX1UECvQZKUhh81
 2X0e1aFn3m69rsvZO51IDmFo3hJmwB0TKm9TXS7y7O/MKQobmQcSpRN0/JgYBXwwAFNNoWcnhTY
 WOn/L88rsT2ZHf4DP0XVtKE92FZRRgdRMYLTcwJ7hDw5mz9f84uLu23NHgkV66ci5tkLvXbF9Ei
 NLmuBsp8+WDnSd2naMncmxgBLGDOT1/tidzYLqo/mMV1qSr9U2xRmTKhS06Q2ds1ap1AI0lm24G
 GWGURZNyanaianrthgXk+6nXxJ6yEgbBTGtQZ0P7kQJ5aUXT1+hxVOxuMyoJIrGgrtq/idh9oZ3
 OV63NfCJRiQzfOSdTHw==
X-Authority-Analysis: v=2.4 cv=PJY/P/qC c=1 sm=1 tr=0 ts=6a14092f cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=gttq3t2AYlGpivilpbwA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250086
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109586-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 8E8685C7CD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 03:47:31PM +0800, Jianping Li wrote:
> 
> On 5/15/2026 9:38 PM, Dmitry Baryshkov wrote:
> > On Fri, May 15, 2026 at 08:42:16PM +0800, Jianping Li wrote:
> > > Allocating and freeing Audio PD memory from userspace is unsafe because
> > > the kernel cannot reliably determine when the DSP has finished using the
> > > memory. Userspace may free buffers while they are still in use by the DSP,
> > > and remote free requests cannot be safely trusted.
> > > 
> > > Allocate the entire Audio PD reserved-memory region upfront during rpmsg
> > > probe and tie its lifetime to the rpmsg channel. This avoids userspace-
> > > controlled alloc/free and ensures memory is reclaimed only when the DSP
> > > shuts down.
> > So, is this a bugfix or not? Is it possible to make the kernel misbehave
> > without this patch being applied?
> 
> Yes, this is a bug fix.

The tag, cc:stable, clear description as the bugfix? How would anybody
guess if the patch is to be backported to earlier kernels or not?

> Because currently after the audio PD requests to grow the heap,
> the current kernel does not support shrinking the heap, which will all cause memory leaks.
> 
> The current modification is to allocate in advance and release uniformly, which will avoid this error.
> 
> Thanks,
> Jianping.
> 
> > 
> > > Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> > > ---
> > >   drivers/misc/fastrpc.c | 107 +++++++++++++++++++----------------------
> > >   1 file changed, 49 insertions(+), 58 deletions(-)
> > > 

-- 
With best wishes
Dmitry

