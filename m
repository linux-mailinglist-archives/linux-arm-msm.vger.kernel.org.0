Return-Path: <linux-arm-msm+bounces-64788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C12FB03AB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 11:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B3F617539B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 09:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08284241673;
	Mon, 14 Jul 2025 09:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G7u3PGTt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706EB23F42A
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 09:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752485053; cv=none; b=USVndmzw/CEXNXQLI5ge22pzJLuBPfPgId8UpMZuJpJ+FvnFQcMCzhUESBkdz9PjCe6NDDusabqS6BRJauBNAaek8Brkgz9y8/4ZjPqniOA5Z9VFa982DFb/5i6jFj0IsFqnvh5uVXBLOk98RE8TsXseCNjPUm+doa1WFH43jxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752485053; c=relaxed/simple;
	bh=vW7zFUT4uisZkBflxFOgTOHHFIpYy4naUQy1oVtrAik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HsXv+8K6/Z3H3kM3nlax3aJoqa9lCkL+nRUYnhioVtk65Pxle8Yl4v2UzPPSTslkQqx4Azjnz61+JtOWnwKNeNj3WQ0r5gpdLL88nKAM08/1yhdZNYW0BVtG2UJ2mgHqQVMY7eCMgp9lJUFnyId1ZM8dOGvTi19YIn1iBGN/8dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G7u3PGTt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DKZPed026465
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 09:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V8ZlHczfnDZoIkoxuSHgxwOK
	2zomSWcRzbFFVNS1tiY=; b=G7u3PGTtAgMTWUTC2phFDAM9W4kHdlSFLbGj21e8
	eFoFKPkD02amzzF7jpZgMh4/Fzm1oB02pdEmutBZfAxq6uf0Hnfdodh9Xnb5j8b8
	OnK81eQ+1zTObpkgicZjAyqPsIk1aE5ZiXXLk0Wlbp2u7JmV/r7tvvyA3YLwK39p
	Ycd9l6hdpm78O9r5ZFF567tNbgHiR2gkkw9h2L7JfhBufY053ydUofK3rYhHFkYf
	Qj4AecpCWR8DAleNFd+zlRnveBcXTDR/vzKJUG53AIbsfcng8+dqnuls0kndZ9b8
	ScshWuwxU0w9rXHDW+vRw6NEKBdSjl1Ab6BuF6Vk3itA8w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut3xsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 09:24:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a585dc5f6aso84968461cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 02:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752485049; x=1753089849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8ZlHczfnDZoIkoxuSHgxwOK2zomSWcRzbFFVNS1tiY=;
        b=vRFnTwyXY2TSIkqLEia0IxTaumnEWGZXlwlwHRmO9CIYcfvyVfMnw9WB16S+hWrOSU
         uWKqayUk+bj/NAaLEyOW++y/ebeKDHZIf/sFy1QpBwcWUeePiS5BgGFCHK4t/mVebTpO
         fAdetGlPW8mEeZ8z17vqtjtDX/9vD3gbPBHNgM8KHT4vNjAxzASUE+uoeRbhKvJfeiyw
         gkTu8XqK9AtwYeNaEdUnOR8d9dZuVsxfgp1v558g9JUvqiP75Q6lNrRvXyNjXeJMT53K
         iFmQ4ShjyiXU1LELymkMSLSj8XttIxOLciYjdRQRDP7QvQ3uGgRG4AU8d/ErFI/i7fH8
         38iw==
X-Forwarded-Encrypted: i=1; AJvYcCXkwYnariHTjGE+BzeK4kV4gRGnx9BY3U5K40jnq7xWBZzIfVoja96Q0MKoE19iTgFBIez2t/kKRWb2Ox4V@vger.kernel.org
X-Gm-Message-State: AOJu0YxsukAV6dMhMaAXyWC4MaIK4WQ8pgNLAg4Gd7jIZirmTLSVEoMq
	WBUWToa6AFB1wlsjNTAjvfgszLCc3jQN+xKF81sUgB4NLF50Zxvhyz2pUh9prLiVuZD8oE8Vfc6
	YJWX1vUboE/H58JWj0X6R88SKEks5L4dn+sclYpM/AJd17x02biRS9NrBbXdbcMaW+OTF
X-Gm-Gg: ASbGncuBkGA4a2ZD9eRetL/8ebOMFOkPeAOrQTOIBEcrmhCebeBq7sTNLLdfen5OJdV
	4YtHas+vezQ5NSMBZ4CjcnKSekJnYXYtzx3nAIfBqWDMC8y+HpNs+rfGF92V/qDaeUjRXKWXtMt
	tOYAbgtbKi8V4ls/LX2um3kQTkp5Mp0ZdFma1z/ymyjPOMP9EutlMMoaZH/eUkqZdBaw/KI9TDt
	+D9UeVo1iXoefM6ScwxY+rFlXFV5QOcBubjHOevjJuJUj5ohGaRYpXmV87+dnlTS5oBAplcR4R6
	Pe0VdAZhDn82lQrWk3W7m5G6Cm4UARbq1uHqphevc2POpCKF0NQaGGaEgeKHEclODR6s273TBzy
	5UQVftNwNEpVv7UxNPv28YcIu191rkS2OXT/sjBeZ86IAeqQgBqnY
X-Received: by 2002:a05:6214:5017:b0:704:95ce:17da with SMTP id 6a1803df08f44-704a40c8425mr184203436d6.11.1752485049023;
        Mon, 14 Jul 2025 02:24:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIT36I3m4hHfAONrGfjJUxqWcUbn30oEyBIYCebfEJkEpfuMOuhby4qawcjOVW/7vsoAXGEw==
X-Received: by 2002:a05:6214:5017:b0:704:95ce:17da with SMTP id 6a1803df08f44-704a40c8425mr184203246d6.11.1752485048417;
        Mon, 14 Jul 2025 02:24:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fab91a480sm14418941fa.112.2025.07.14.02.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 02:24:07 -0700 (PDT)
Date: Mon, 14 Jul 2025 12:24:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: dwc3: qcom: Remove extcon functionality from glue
Message-ID: <h4gvc73zp5csthn6fk3upj45xbtlijove67gigfgrvzi6gwu3k@y6v4lggyqf2u>
References: <20250714044703.2091075-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714044703.2091075-1-krishna.kurapati@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=6874ccba cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gYDs5GclryXmtiFo2a0A:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: LJVoyZxsnzPdliRXcKqRSeMFiwlw3ev_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA1NCBTYWx0ZWRfX8HDz4zGKD7yv
 PZnhD8nRbvFbt77/HxHgPfFcvhA1UHlBwBRhdKppSGVCximlcgOeWlf/87Vg9p+Ph625JVaJA4w
 hNj1ZKH+eTQFW31nPLzD9P6goDtg2LgO37DdDXAkOT5D9vSKvB6S+e0BSkklvetFHqXKzjFLxyU
 6RFytaYd3QHo9l2RFOlLOjZ8k4y7eo1gBToGw5cwbTvcgxVeFAvJbeLucWHBqz9QOn6ehVM9alU
 iQJwG5A6+2DF25W61gcQyhGhfXAKUUORzUmx+BinO7184/f5oKsfIgksYzoOwLqGq0M6juba0Ow
 uBpNlxQFFUMaRw1WpGaj39clzxhpUfyUrWn8rK9i90Hq/VffP/XJtAR0T/xBebYYYoSiWRJXrTX
 fLN8TZ4g0v/eLUf/RfLyOosSYKPjVxm7Dyo5Hk/Xd0zC8nNqRFW+DgTgHYE39ib1tP+UtQim
X-Proofpoint-ORIG-GUID: LJVoyZxsnzPdliRXcKqRSeMFiwlw3ev_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=944 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140054

On Mon, Jul 14, 2025 at 10:17:02AM +0530, Krishna Kurapati wrote:
> Deprecate usage of extcon functionality from the glue driver. Now
> that the glue driver is a flattened implementation, all existing
> DTs would eventually move to new bindings. While doing so let them
> make use of role-switch/ typec frameworks to provide role data
> rather than using extcon.
> 
> On upstream, summary of targets/platforms using extcon is as follows:
> 
> 1. MSM8916 and MSM8939 use Chipidea controller, hence the changes have no
> effect on them.
> 
> 2. Of the other extcon users, most of them use "linux,extcon-usb-gpio"
> driver which relies on id/vbus gpios to inform role changes. This can be
> transitioned to role switch based driver (usb-conn-gpio) while flattening
> those platforms to move away from extcon and rely on role
> switching.
> 
> 3. The one target that uses dwc3 controller and extcon and is not based
> on reading gpios is "arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi".
> This platform uses TI chip to provide extcon. If usb on this platform is
> being flattneed, then effort should be put in to define a usb-c-connector
> device in DT and make use of role switch functionality in TUSB320L driver.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> Changes in v3:
> This change was 4rth patch in [1]. It was suggested to make this as the
> first patch of the series. Since this is independent of role switch
> patches, sending this out separately. Removed RB Tag of Dmitry since the
> patch has been changed.
> 
> [1]: https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/
> 
>  drivers/usb/dwc3/dwc3-qcom.c | 90 +-----------------------------------
>  1 file changed, 1 insertion(+), 89 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

