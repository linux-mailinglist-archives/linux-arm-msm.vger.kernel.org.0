Return-Path: <linux-arm-msm+bounces-75932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5081BB7AE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 19:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FC324A26B6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 17:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1602D879B;
	Fri,  3 Oct 2025 17:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZvOK6SXT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF1F260590
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 17:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759511647; cv=none; b=JfU7OpXuPSkjsOPzKR6kzW6grdGVgPAte9IG3peNc6jTfonb61Qw6IvDsuyarCQ9KzNpESpz8YcGFZbdbH4pgRhQTngvVtgrT6HSQITgepH3AaEG2WXeuT5TmSVsC4HQKyfuuC9lg2a5l66qu47MTrin7aEzepwLytjzt+Une0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759511647; c=relaxed/simple;
	bh=sRXN7wdWBdzUwr0/A2cwW5ynUeLKYkEY8qUaCZEgH7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKg7ZnTWZp/4yXsAkB2XDQnf15Jyg28Aq0xaStGGqOtnw7S3GuzuvIV2Qmui7F5KZfYi8WJOh0avwTlRoXjG2aQj4RSCSmoqWGiRKNGBs7XY1embSvpC1P3Eanxqi87dxW25k46LolbmkdfHRIlkmpvnt2vRVf2msAbdGLhP5NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZvOK6SXT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593BDij0024130
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 17:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w3Aan5Y538FKID4Zme+09bSf
	ZawmXE/Z3TfUDYtZLco=; b=ZvOK6SXTiGxwJA5O8q0E6YRJIQWlP/SIL7BBvjvx
	ktJ3KWhxKbewT+wO0IoEqojsHme6LMc2jgqRZCbELPmup8XesK55EiHXsc1iuEIj
	XW+VJmQmJDAh6gfKl59aZdzCskN2mO7HNn/wldfFrra8aGIlUeZsm5XMStqPys/a
	P3j5amWXD+4UVoEIOKvicZg7z5DsYwvvJEvVNARi67nU2r14J76iSzzJPtNCinFz
	aVwngPwlsmxo/WZ67lxylz8ukhf1/xJh2ICZGa6KuvdLY/AWU1nd9478I5+je0/+
	zpmaqfeLCcNSA6hsnAvogx7861uaJmBGbtJpDjozB4mg1A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a6bgbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 17:14:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e576157d54so30654961cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 10:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759511644; x=1760116444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3Aan5Y538FKID4Zme+09bSfZawmXE/Z3TfUDYtZLco=;
        b=XiJj2u2MwWlWsO+BlT6zYj74bvyGIAp58xyJnFvXiU42kykg20bgCN2iAGJ4Jz2f1d
         h0bsAXdGv7GO1y9vsXotclHjjV//JF5QKlWxvbtpWtO/DIIP9KaT9sZ2A1pcjUvlTZzL
         +cP/Zd8fVsx5NUrHXqApt/1LES1qJ8O3SN7puxv8xiRSp+jmoQ54QSAI2y22JlhJKXlj
         PHOESJsQJBH6U7/6u4w2QI7pAa/NkLjqd8VMnX5Q+R6mRn4Veb2Yr47cPJ20YzvIYfTz
         IbAG3yQ+ymnYretc6LkOtKqlfHGAE2NFy090QNbSWFXLB9zGR4iFlTJardqTXKKdyFZw
         68mg==
X-Forwarded-Encrypted: i=1; AJvYcCVuLIuYzC4AHg2uB6JP0QRaF7p2CYfNI2EDKJFNtdrLcVQajVrPkwyh6cBJyrC6HJQasFtANlnoAKmoRoe/@vger.kernel.org
X-Gm-Message-State: AOJu0YyzL8htzk2Ii4kAOyQepglwDrb99vXi714LqX3dg6ufAEkbWTaE
	bdvQrARrbi7bF9nPrrJCddxrUni7HRUncy/tSRHUUXeY0+rOlqA0Doq2J9EtWMYsVpZH4XoUlLW
	pMqWEKih+56MGFcGkL2CcEv+VViZzPZ6CL/KazbkzwaZXe40GZ2Q1llULwCmrLM+J83iI
X-Gm-Gg: ASbGncteE47QSUHV0lNYTIk4tnnZ43zIrctrmaySTqH6V9jQsox0eqiwkfZLyTRizRV
	BNZzG3H5+TAMioBAuPS4X/Y5UzmqNPNJ4ascpR+uVDfKQg2475P8lh7SYO+KQWqrgU7VXIVBGiR
	8Vl/kDvBBTEfJo5KpHZgEV0v1NupE7ZiBbFxdQ44HR5nYsRN60HCNTuhcSWM5BsXJLeJPK2L943
	ZreNtMxhxflPY3c9WG1/bzQQIT5CKj05DQjqqFIBPlLzlUvfbjXSaPScQ8/ZMZq7MnJ06jpVci+
	rGUYXQvf33xjLcU9yyt+CTNI6m1W6aQuL8/CaFBTrmsS/cCo35UMTPSBSE0n6aoRegtXaVe5H8p
	eHOWgs5fVLGoEsZhVijT03meMu/XzkY4vvAcyGKmMQRAW6Qiw3DsnO4ayDQ==
X-Received: by 2002:a05:622a:1247:b0:4e0:3cdb:d1dc with SMTP id d75a77b69052e-4e576ab90e1mr48287031cf.43.1759511643775;
        Fri, 03 Oct 2025 10:14:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkV77r7PT0L/lrRELV9noKeQLSHDewsA/eylq6OZ4OFiGR32HGy/BEXU6rkm2xWDWluN3TxQ==
X-Received: by 2002:a05:622a:1247:b0:4e0:3cdb:d1dc with SMTP id d75a77b69052e-4e576ab90e1mr48286431cf.43.1759511643127;
        Fri, 03 Oct 2025 10:14:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01124414sm1996946e87.26.2025.10.03.10.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 10:14:02 -0700 (PDT)
Date: Fri, 3 Oct 2025 20:13:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v3 07/11] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Add wifi node
Message-ID: <gfbvgsen75w5h7afyo454pvdfslkeprqyuycuok6syinbza7vx@crapzdo33re7>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-7-b14cf9e9a928@postmarketos.org>
 <f58493a9-6def-4610-9c3e-d6a877dc23d3@oss.qualcomm.com>
 <d38801bc77ad00442b1669ea252ae30a5c6af5b4@postmarketos.org>
 <7661d9d9-eca3-4708-8162-960df0d7f6c7@oss.qualcomm.com>
 <ad721948b83a54eaa34f367e12564fe6acc222a1@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad721948b83a54eaa34f367e12564fe6acc222a1@postmarketos.org>
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68e0045c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=QgkLZLD_Px6AUkAJ0r8A:9 a=lqcHg5cX4UMA:10
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 36iDbqY1Qe41_nBCio8_nfqH8bdkQGoF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX1EYD0xLTVhWC
 E2s9pWtAjaH9CUr+mk1KrNxQrO7khYYIj8cwINncX5M1XZDvpbNRG+4jl3ihpBoZ852nsHplkRI
 VE++YkwKqyxQ8eBe/hEtWWMxqU0PKhbulUfBDj7sKrFzktOlbbbyo3ZcyoFRUUjSzqWq1auVNum
 l+3Nq57S7sS8/LseE6MtxwuRq8ZL36/mXwqZn6DMsTMj7N/jlGSGj4Iky4hAOUVDVLvEn+/1nR4
 XVtA9RsYhkEqxudt7uk2rM4H3l89xGZW2isgD87wjbTTpf38tD0lQXWvsH6NWtgIg0KbU3EDrQm
 5+xE7mn+UoJYCGvRNrPuVMVWyNIKkJb5zuXo34za+96lqp0Szatak0+itWa2+1D6a3H1ot6GP4a
 HXQWY/WIYu0GKwhr1TgdGWX1Z4mFBw==
X-Proofpoint-ORIG-GUID: 36iDbqY1Qe41_nBCio8_nfqH8bdkQGoF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033

On Thu, Oct 02, 2025 at 07:26:16PM +0000, Paul Sajna wrote:
> October 2, 2025 at 9:37 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
> 
> 
> > 
> > On 10/2/25 6:51 AM, Paul Sajna wrote:
> > 
> > > 
> > > October 1, 2025 at 9:14 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote
> > >  
> > >  
> > > 
> > > > 
> > > > As the dt-checker points out, there is no such property
> > > > 
> > > >  If your wi-fi works regardless of that, you probably don't need
> > > >  to set the one you intended to
> > > > 
> > > >  Konrad
> > > > 
> > >  
> > >  Perhaps this only exists in the postmarketos tree, but it definitely exists, and doesn't work without it. I'll remove it for upstreaming for now but hopefully someone sorts that out. upstream.
> > > 
> > So you didn't test the tree you sent? :/
> > 
> > fwiw
> > 
> > drivers/net/wireless/ath/ath10k/snoc.c:
> >  qcom,snoc-host-cap-8bit-quirk
> > 
> > Konrad
> >
> 
> I think I'll probably just drop this until a bunch of other stuff is upstreamed. mdss is totally broken on mainline, wi-fi doesn't work, fuel gauge is missing, etc. etc.

Please make sure that the parts you are sending upstream are actually
working on the upstream tree. Otherwise somebody might try running
upstream without extra patches and be surprised about it not working.

The patchseres in question was submitted in 2020 and got rejected. Since
that time we have added support for machine-specific firmware-N.bin, so
Kalle's suggestion can now be implemented easily.

Regarding the MDSS. Is it being solved by adding reset to the MDSS node?
Or are there any other issues?

> 
> I tried the 8-bit quirk and it didn't help.

-- 
With best wishes
Dmitry

