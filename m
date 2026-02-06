Return-Path: <linux-arm-msm+bounces-92028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CN6mGO7YhWlZHQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 13:05:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E05FD742
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 13:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDFD0302415D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 12:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3BDF396D2B;
	Fri,  6 Feb 2026 12:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PXMR+MJE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hzjJ4lv3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC7433A70A
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 12:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770379427; cv=none; b=oTP0yTxt7QDBj8EW2g0St2fr1lVFCQJ5OE5MZJRAsDDNCNHhcq0Io685/owXpRSYR+xH0mBLChF46TnCw5qErqL+UtKC9gBqIDTGEd/5n7hdBVnFL7zLiApkreyC8EkxVSQwX7ScQ/ZIIQettdvlrxgS83NoltGTLiTtVXKQtqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770379427; c=relaxed/simple;
	bh=uy8KSJl1E4N7YPO0LpxK5qPqXXBNu7tHP4Vg5Bk3lZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iX5xj6cK9I5iKJ+WPPA2clNlBiwmrKiEUjVXPKg9JPYstKVdAvSgABlpcypor+9hKh74R5T9EvzHAgFeatmuUJEbBRSlao8lp2m1Q65o3VvFbBwPvRSHvk0pNsqw3iaGLelDBmpxNgKORmIE0MI9F/Z/uYDRoJWHGc/qL/iqjoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PXMR+MJE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hzjJ4lv3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6167Xfmg1852741
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 12:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D7T/znkIGcIBDaQtDiqCYQV9+wOLqdbwc+EurdTvLiI=; b=PXMR+MJEslhETkVY
	MCMDVLvFyILaRh7tUetTxZ1avmPppThdRXrnzIv4eR4QpWJ4qPm406rCNr/yqZVn
	JZaIJvbDel4i5scGM7hbwIoZjPzdvp05lu2+fOuxhIezU9SM/HdOG7u8GxBr1n4i
	lAaX6u7WY0lSBMNtQqegg1eL2YFzc0B9fE08f9wpuGcJ1Q/3dIbxycXQDoYfy4FJ
	Nn5qclHYayIGdoDNZNK03ICt361Xx1Sr4P6bLF+h/mUVPfKlMRQkHVdqOjLBIeQD
	sr3jLAjcK7bYaYB0Dx4/Q5nFl8y18MXVoazLVUT2M8ZFFvRSi3ms5j+AACWI8Hu8
	jynHiw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5c148tm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 12:03:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso5121783a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 04:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770379426; x=1770984226; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D7T/znkIGcIBDaQtDiqCYQV9+wOLqdbwc+EurdTvLiI=;
        b=hzjJ4lv3xpv/7OreRoHOONs49TP6jCarw6gXfZYN0SERy2KakzPUrbKtdAE4XmrfYg
         JXyKSDIn4aF895miPo5yyyAuNvDhX3D/q7cs9yRPe5i/0gY/+ycOwpSWuUnLawNkkpSs
         XbRrl/qrY6siKlWYpNgUKxbxul+RQUbKOmZOXsbYGaxQfIKokPbQ4yAwRw9M61tlPuMg
         gn5s6b5vIhIDzcuW6Z5PK/YXc3RTlZhQYOefumwV38Ghj0h9DBNpOTnGf4T9zTGh4YnN
         JCTNY3fyOKpLgT4gPU1jRkwZ4WrsQ6tppyOIEXhyNsRRlrPrU7SLclq1rnqRHb7EbO49
         MdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770379426; x=1770984226;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D7T/znkIGcIBDaQtDiqCYQV9+wOLqdbwc+EurdTvLiI=;
        b=YB5cqkUuyux55lPSbFP2qjX7ArLBgEkj6yF2A6drhqFCdBc+QlPMiB4yYIE1Ul3oMb
         MCIZKocIS3MkaTUhIWYWGhS/p6waBf8Yprzej7gSj2/livPwo/vAGxv0gWPn2Se3r9Ii
         qsrJGvP2RirfSj1uR/z/FNIFELLQlqH9QeukyexHaU84n3TB2jNL+gUMG5LaN9kaWW7f
         aMPn1k4m5QJrGW1ncSo43+ff+ICGeiN3zc2lQMiKnD4KVe8GSYL+tHKXjQPbfoz89l0z
         g0OCrEaEw1rHY1rXVwlppSzFmjj8hFL/yI0lKc+7+t9Gb6c2qc99TIFA1LxPVTedRGVF
         xWtg==
X-Forwarded-Encrypted: i=1; AJvYcCUZvySVcGfxqfa1OGiPR1kp6nSeUzViqZJEjECWdiqQfYZt2rqJHh+/bZQU2GLKcyqkJ5qK9KWOhlsuIPGj@vger.kernel.org
X-Gm-Message-State: AOJu0YzN7Q9tRML7JUOE9PnRbo94oOkAvnHVHs9eYj9bBycK9HmK3vI+
	vsL6ezjKbv9QrsxDeJPt26R8WKzu1fS5s4ONaJMeq3WtrfGWSaoYZM9eq2yCzsjUgzMTIouZ0Fy
	LtioMzk/QwoHhIZwOWQSBu+j+8rjJmoiZ45sOfky5i9FQCMnarvi6CZgnhXK+E3Ol4kqi
X-Gm-Gg: AZuq6aIVZm8Tgpc8Bp4H3uEevSLOgau5O34k25MAh7k5RYjgIR9BpRNeGNipybKveAY
	M3jvflgf6LypOoqjhH+I9d4t+9ypM+Xq5fJUwHUW/RIFR9b0LCQydX3hFHPsEOtqE/wumpyO4r6
	6OqAQDX73/Ypbg8fbxiuLOrt8UtK6OnBVE77nQdRp4YmdpcjcHPoAbYCqLli4w8a0jRtt3wdQus
	w2fK6/FzMaXLCJu8iHQ3HYHbSPttLrYUjxq+Y7naKZs2a1arUyMe460C/vyFBtEK1LUo6XUblZ1
	3A0EiDmaRRTzqnXfVRhglAI8mfN7zEvWVceFJoSo9AXK9tvH8gX7GcyPLXk1ZL2jUnX51abG11k
	++vJQcP9b+M8N149QMeNtfP3r+2TGzCs/wQCFIaehPPWKd80=
X-Received: by 2002:a05:6a21:150c:b0:392:e583:b766 with SMTP id adf61e73a8af0-393ad339ac9mr2560264637.42.1770379426374;
        Fri, 06 Feb 2026 04:03:46 -0800 (PST)
X-Received: by 2002:a05:6a21:150c:b0:392:e583:b766 with SMTP id adf61e73a8af0-393ad339ac9mr2560231637.42.1770379425888;
        Fri, 06 Feb 2026 04:03:45 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb4fbcbdsm2262924a12.4.2026.02.06.04.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 04:03:45 -0800 (PST)
Date: Fri, 6 Feb 2026 17:33:38 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Enable ICE clock scaling
Message-ID: <aYXYmnFiFbZnVRqX@hu-arakshit-hyd.qualcomm.com>
References: <20260128-enable-ufs-ice-clock-scaling-v4-0-260141e8fce6@oss.qualcomm.com>
 <7b219a50-6971-4a0c-a465-418f8abd5556@oss.qualcomm.com>
 <aYBF3Geeuq2qHmYg@hu-arakshit-hyd.qualcomm.com>
 <cac8e14e-63e4-462a-a505-cd64e81b2d1d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cac8e14e-63e4-462a-a505-cd64e81b2d1d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=P5k3RyAu c=1 sm=1 tr=0 ts=6985d8a3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=LeY25DUbnqDghkOhmf8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA4NCBTYWx0ZWRfX2lJTcFLFZqe6
 brQm5zQtHxsaBNDtB7nakJmVdCym+s80xuK6mQqRIwHGm4MIDitkLnqwQNyXMH4E0WXG1Wzt8qM
 Vd4SVOxfSPzGSj9yZM+iDs6yR8pvexAzBGFLJXvqPMrqUgWy81UmtBemDXlzkAKH5kTjvdJ+H+e
 ErS0IN0QDSefQTa/PSexXiCFFOHGNd6c6B3hFJF5G/BlWVtIummkNEN24cEY7y9MhuuykvH6zLh
 ItAJN3sF/5qu3XM5AfXmYjTiHSKmErYaYTyFzTrMFw3jvv3us7ctmX9WZ3mOE+dW+3s4uNZVJ0Z
 OpPL+nuw9DZkbOuraR8RmvXHVrybpyOJvS1vW6nORvt/MLq5rBQImwE/2XRUHnU4ChQw4gmMcW+
 1TribkZy3gaZ0K0+a2e72v1PaCifCBhBy46G7b9BU7ZOMfRGSR+MBpTuABe3V4j4GmhIWeVdm9o
 3CuheJ1369SC7LWbC7A==
X-Proofpoint-ORIG-GUID: b1uM2QYId-OjXDmOCUhZIxk2N9rD9pc-
X-Proofpoint-GUID: b1uM2QYId-OjXDmOCUhZIxk2N9rD9pc-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_03,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92028-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.981];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B3E05FD742
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 04:01:38PM +0100, Konrad Dybcio wrote:
> On 2/2/26 7:36 AM, Abhinaba Rakshit wrote:
> > On Thu, Jan 29, 2026 at 01:17:51PM +0100, Konrad Dybcio wrote:
> >> On 1/28/26 9:46 AM, Abhinaba Rakshit wrote:
> >>> Introduce support for dynamic clock scaling of the ICE (Inline Crypto Engine)
> >>> using the OPP framework. During ICE device probe, the driver now attempts to
> >>> parse an optional OPP table from the ICE-specific device tree node to
> >>> determine minimum and maximum supported frequencies for DVFS-aware operations.
> >>> API qcom_ice_scale_clk is exposed by ICE driver and is invoked by UFS host
> >>> controller driver in response to clock scaling requests, ensuring coordination
> >>> between ICE and host controller.
> >>>
> >>> For MMC controllers that do not support clock scaling, the ICE clock frequency
> >>> is kept aligned with the MMC controller’s clock rate (TURBO) to ensure
> >>> consistent operation.
> >>
> >> You skipped that bit, so I had to do a little digging..
> >>
> >> This paragraph sounds scary on the surface, as leaving a TURBO vote hanging
> >> would absolutely wreck the power/thermal profile of a running device,
> >> however sdhci-msm's autosuspend functions quiesce the ICE by calling
> >> qcom_ice_suspend()
> >>
> >> I think you're missing a dev_pm_opp_set(dev, NULL) or so in that function
> >> and a mirrored restore in _resume
> > 
> > Thanks for pointing this out, its an important piece which is missed.
> > We can use dev_pm_opp_set_rate(dev, 0/min_freq) in _suspend and restore the
> 
> FWIW
> 
> dev_pm_opp_set_rate(0) will drop the rpmh vote altogether and NOT
> disable the clock or change its rate
> 
> dev_pm_opp_set_rate(min_freq) will *lower* the rpmh vote and DO
> set_rate (the clock is also left on)
> 
> Konrad
>

Thanks for the info.
I guess, dev_pm_opp_set_rate(dev, 0) seems more ideal as this is
API is for full quiesce mode and the clocks are anyway gated in
the suspend call (clk_disable_unprepare).
 
Abhinaba Rakshit

