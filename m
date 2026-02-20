Return-Path: <linux-arm-msm+bounces-93494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGv2LWZCmGneDwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 12:15:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A12616732C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 12:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F7AD302A56C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 11:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF7B32AADE;
	Fri, 20 Feb 2026 11:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="en7PT6MU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PnoRQiUI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E9332D441
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 11:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771586147; cv=none; b=A4DzIZjtR6HsSMHrcPFTwC33MP32Qtqtn5vj6tjmN6z7+5qLfdWBLdqDF2zgd/6UhMRw27rv1fByIblS2XSMsfXkmMgExKM6C/mbuWDF5ohUOIt6V6XtTElNazvWfFJEVAo8B3iqvyK2oxT3rbmmI50XJPhI05wgckYclcEcRXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771586147; c=relaxed/simple;
	bh=U7jG7pwKgorBrNi2MpLPry9SRJx9mEM+lupPKzoDmS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6PrDK2cqjPJ02PWf8RlUHKoBO/gm5hCS57bNaaunKfOoMIG2KWf3ilo7A4X16ard7SI5wJDyDBFf/A13YpvjizsXkDDwDw/zCVGZi7ne1wCcTOSmwSvzz6u32sRQX9PzHAl6D2PUS27wciZwFYLhDPPgmYZ06eo2oKxkeni04g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=en7PT6MU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PnoRQiUI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5RmTu2431069
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 11:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b2GYOalqmiTplVooSJ9TenZd
	k0ZNjxw6paig2ezJLo0=; b=en7PT6MUG8JNUziVY5gM0Vb1J4sLtuA31epz4g5I
	OUQpyNiD8xiBkQrTN/sXtsUdS0TZni9+LkBJ7fTPXViXAHjaVAwEg+E8XL90xSgv
	CH2nkuypCPw2KkjfM692JIwr3o1Bjh3Bgmxv/jUxXP1vVrM9to0P2UlSF1aIrmXT
	6i654tEJqgbwNt3XhzjWMmh7zbQgOiP4yv/x5HgAv+rz/o8Ka52e+SGXOLfNIraA
	YOfcvQoU0o3/QqdCEeEj4INqZ/itjHkAKy/kFG9j3iIdWS+JBcu8DYnOBIlfT4IZ
	XLXhnFphCEezuE/3kcjPqXsn4uN7kGWYuWn6JYAF/dzSNQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ceh4j0uss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 11:15:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8249cbbf769so946271b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 03:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771586144; x=1772190944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b2GYOalqmiTplVooSJ9TenZdk0ZNjxw6paig2ezJLo0=;
        b=PnoRQiUIO6/IDRniTrItmIuzMsLTbfQWWuLcC3YrKHWchRttvSpvyHaISIg7Knhu80
         lduSz1vyj5naSdzKovdzi1aml5tpRlwESDih2pzA2QcXtkwiHjvvshbCb0+PYjAV+ctP
         SlhDJLlqayYfXnnFXoI5SzcCNjtXV79R4i5rKn0jJo1462MG6TCHrWSgD+aPzVcajP5L
         LPg7Ve5wwljreef7GpAuzYjkPg41ix7d7HhNada9IhaZ3E5hi0H35YbOXzgMmcsldrX4
         rnDz8WOvQSk/kGdQw3bZrwPcfZTynPJTzxGAzpTBt84YUXRvW0yKsbOaDhOg5HwDq+2T
         WwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771586144; x=1772190944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2GYOalqmiTplVooSJ9TenZdk0ZNjxw6paig2ezJLo0=;
        b=lROuP9XfoHFyi+l+ONp5j4l936natQcoFljZ8cos/3EPBR8POLvsDLgtnAeJA/Bb4N
         A1bbXDm4Vy8IFzlTa18pd9iMiJlwzR/xe1R5Co1QRjkoavxbK+DcpFH2++IDY+zKh1Ev
         zWbdYAcnK7Mrv+MpR2NK31O7PrPegLByI/MAOnCIGLd5f4hG17ILGGmR8MpmzHb/TzMP
         VJcO/OtlkuekCU3y+jfRiOeIcsYlh89IZoe5pKy2qsbZADZU81oXLYhkGQkgRHb6YlFc
         6+wZDPGT22bdvxWNBSEvIeEoPdsItCQW1yjhjEtc46rssZV/3zRl24HjuTkNy77+R/v7
         lAwg==
X-Forwarded-Encrypted: i=1; AJvYcCXEue2VWEWBYeVJSZHE1oVfFEYVxRAMiekq0/xZIezWtnpT3lE4ujXEZqnxIyhJRsTxDnDka/KUL/geFH2D@vger.kernel.org
X-Gm-Message-State: AOJu0Ywupv9rvkPQO75BXUvLOfAy3/hFhVU21ZOD/lJf3DiHtQoWzOJE
	11nQ7phTmSeFvLo341ZTrRm8Ikr3g+MH8LNaIFC8bnMCRRVmLgJtF0qn6qlfB8ocGenJn0bhlJz
	T5nmT5/OI10UL+g2Tx+PaaZXHZVkBaoKWrg2ro/udp7ObdzIhpjSkbXGU3Ia2cYoDjYnP
X-Gm-Gg: AZuq6aKIBowM7ipdPdycqHPjUt13JQ26BNXL+N2JBqLP+Poj4WJg44dzJbiaceJbjPL
	0Z7ZxQb3ePOGwv2XH+eLIdQpt2h6NwFxXU1nVr6P6TjLFBUyXa7I8ZP+nciXc9obsq8mYadGxh9
	g+jMFVXr2jcH5jxK7tYClXKEY8UnbrF4V5j4vGdpjzQjA1RvuMrs+NCHfnBHOApQleEgdPgJlr9
	FfHToZdVOHZG4NXTCoxDt68DWMy46yPkCmpVJa2Z6fPLcaHXfv8K56DtKTEkcLG3lL9cHcsHJs+
	8k6VWDmblBiawjRxR3qbKaW0lUnzPGS4jTacPRP1VbOVyU/TR/hOgyOHFbdR/RUNr+jSCuh3btl
	MRRUio6iHmNqyqDNiOWTc5AOkpB5fQHVmoU7PgZB1dDiPmiuMdkGPZL9z4Lo=
X-Received: by 2002:a05:6a00:439b:b0:824:16ae:9ec4 with SMTP id d2e1a72fcca58-8252771735cmr7655827b3a.63.1771586144210;
        Fri, 20 Feb 2026 03:15:44 -0800 (PST)
X-Received: by 2002:a05:6a00:439b:b0:824:16ae:9ec4 with SMTP id d2e1a72fcca58-8252771735cmr7655793b3a.63.1771586143732;
        Fri, 20 Feb 2026 03:15:43 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6bb5acesm26585871b3a.63.2026.02.20.03.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 03:15:43 -0800 (PST)
Date: Fri, 20 Feb 2026 16:45:36 +0530
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
Subject: Re: [PATCH v5 2/4] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
Message-ID: <aZhCWMTi3seAbXo5@hu-arakshit-hyd.qualcomm.com>
References: <20260211-enable-ufs-ice-clock-scaling-v5-0-221c520a1f2e@oss.qualcomm.com>
 <20260211-enable-ufs-ice-clock-scaling-v5-2-221c520a1f2e@oss.qualcomm.com>
 <bfbe04db-bf64-418b-a75a-88879bf0bf2d@oss.qualcomm.com>
 <aY7MidG/Kcrs83O9@hu-arakshit-hyd.qualcomm.com>
 <3ecb8d08-64cb-4fe1-bebd-1532dc5a86af@oss.qualcomm.com>
 <aZYMwyEQD9RPQnjs@hu-arakshit-hyd.qualcomm.com>
 <6d2c99c4-3fe0-4e79-94e8-98b752158bd6@oss.qualcomm.com>
 <aZgOUv+QweA7vE1W@hu-arakshit-hyd.qualcomm.com>
 <5bf31bf9-835b-4b87-a4d0-8452d516f13c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5bf31bf9-835b-4b87-a4d0-8452d516f13c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA5OCBTYWx0ZWRfX/Kb44mi+4AmE
 Rz3CfvdVJOk/YHHF/I4BNg4WjAknovayiatlEctB/7V925vB65UafO+Io2FQo71TPH/p4CWxTSK
 TxeLibY0UBNQV503SUipMkCFOPPU5zVJdjY9eJr6eq9h3utRnatUXVdoKM5AGUdYfcvN1MP8VtK
 0LNXvA2FuvmGuvdx2PqvzqHfMFnQJfhLIgDIQCuQiir+b3wXa5cWQxYTOMoFCdkERoffI49yruJ
 R/Ln+XTsIJDe22gN/6JVQjnHCmn/y3wuBMvgXnaD4cVst7K7jiW0cA95kp2dQKYYGeDpL78q0Kr
 qr4IQIDDQejg/RelrhTaWM5fEO/BH/wsYYta+g225eYGJdLJHVO1Co08yivTdcDNhG1rcwzoFXs
 KHLkntwZImrdFmhCtsQumoR5DEI/NgjVJnwm4okuWMZ9nCB52iwiu/+s8igZ4h6Ccie7HGiFJ3F
 NhOSnh11+rT4e0c8F7A==
X-Authority-Analysis: v=2.4 cv=R/0O2NRX c=1 sm=1 tr=0 ts=69984261 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=-r4YXHmrKH74x9D_t9cA:9 a=CjuIK1q_8ugA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: Z9gb7ft6nRQPXnEQm9zcM1yVV57eyCRp
X-Proofpoint-ORIG-GUID: Z9gb7ft6nRQPXnEQm9zcM1yVV57eyCRp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93494-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,hu-arakshit-hyd.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3A12616732C
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 10:42:58AM +0100, Konrad Dybcio wrote:
> On 2/20/26 8:33 AM, Abhinaba Rakshit wrote:
> > On Thu, Feb 19, 2026 at 03:20:31PM +0100, Konrad Dybcio wrote:
> >> On 2/18/26 8:02 PM, Abhinaba Rakshit wrote:
> >>> On Mon, Feb 16, 2026 at 01:18:57PM +0100, Konrad Dybcio wrote:
> >>>> On 2/13/26 8:02 AM, Abhinaba Rakshit wrote:
> >>>>> On Thu, Feb 12, 2026 at 12:30:00PM +0100, Konrad Dybcio wrote:
> >>>>>> On 2/11/26 10:47 AM, Abhinaba Rakshit wrote:
> >>>>>>> Register optional operation-points-v2 table for ICE device
> >>>>>>> and aquire its minimum and maximum frequency during ICE
> >>>>>>> device probe.
> >>
> >> [...]
> >>
> >>>>> However, my main concern was for the corner cases, where:
> >>>>> (target_freq > max && ROUND_CEIL)
> >>>>> and
> >>>>> (target_freq < min && ROUND_FLOOR)
> >>>>> In both the cases, the OPP APIs will fail and the clock remains unchanged.
> >>>>
> >>>> I would argue that's expected behavior, if the requested rate can not
> >>>> be achieved, the "set_rate"-like function should fail
> >>>>
> >>>>> Hence, I added the checks to make the API as generic/robust as possible.
> >>>>
> >>>> AFAICT we generally set storage_ctrl_rate == ice_clk_rate with some slight
> >>>> play, but the latter never goes above the FMAX of the former
> >>>>
> >>>> For the second case, I'm not sure it's valid. For "find lowest rate" I would
> >>>> expect find_freq_*ceil*(rate=0). For other cases of scale-down I would expect
> >>>> that we want to keep the clock at >= (or ideally == )storage_ctrl_clk anyway
> >>>> so I'm not sure _floor() is useful
> >>>
> >>> Clear, I guess, the idea is to ensure ice-clk <= storage-clk in case of scale_up
> >>> and ice-clk >= storage-clk in case of scale_down.
> >>
> >> I don't quite understand the first case (ice <= storage for scale_up), could you
> >> please elaborate?
> > 
> > Here I basically mean to say is that, as you mentioned "we generally set
> > storage_ctrl_rate == ice_clk_rate, but latter never goes above the FMAX of the former".
> > I guess, the ideal way to handle this is to ensure using _floor when we want to scale_up.
> > This ensures the ice_clk does not vote for more that what storage_ctrl is running on.
> 
> Right, but what I was asking specifically is why we don't want that to happen

I would argue saying that, having ice_clk higher than storage_ctrl_clk does
not makes sense, as it will not improve the throughput since the controller
clock rate will still be a bottle-neck and it will surely drain more power.
 
> > Also, this avoids the corner case, where target_freq provided is higher that the supporter
> > rates (descriped in ICE OPP-table) for ICE, using _ceil makes no sense.
> 
> This is potentially a valid concern, do we have cases of storage_clk > ice_clk?

As of now, on the UFS storages (targets KLMT) I dont see the
storage_clk (FMAX) > ice_clk (FMAX). They are mostly equal.
However, I am not sure, about all the other targets and cannot
call the same will persist on the upcommings as well.

Abhinaba Rakshit

