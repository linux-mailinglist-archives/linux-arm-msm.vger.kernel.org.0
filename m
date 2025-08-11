Return-Path: <linux-arm-msm+bounces-68327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B5FB205E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:42:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AE637AE8F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6A6242D78;
	Mon, 11 Aug 2025 10:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzHvd2rR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB3D2367C5
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908936; cv=none; b=EE6b15fNEWneOplybfZaL2GycYV2Yrz2gV1WOGtxSmax+TirW0yHeljsKWrp3z31fU3jYwHowxj0r8L0KwgeGOz8bewn56dnGN4zYSBuH8CckkZagaji/JxopGfE7eJ8fYCjrUlWp0zVjPa9C/G4eQtsV+OQmtNvOP78eZBNHC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908936; c=relaxed/simple;
	bh=rFk0obRi8hQtLDiwnMoImh6BTsNZLVJ4wl38YdBMggg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r62WCM3TBPIWpgJV+ViCc6rXJWgeaRmo3SfyReyVSsyx3QopDTTGzQn9kOZFGiN0pPB2d0SP71k7/JnL6CpM45V5eM6CqOnezK3+qQWKCzW+yOa9GR3Sbv9dxD1DIbomSo2jQXt8rvMSqIY37YMFxNDXv0Dj/Fs1aWUfeLroy/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fzHvd2rR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9d9sn007556
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/qUBFM4nwPLNpeQX8mDV+PjW
	qifSyvBHQ3VDet7iAq8=; b=fzHvd2rRBOx/3w/ZRNedtMiKH0Vue6b5+BXkuq6q
	/m2PzNgdcKiI1nZunQRLkjX0sBfSEuXyBssJfuEmRRR1Pluoe7eYanjkfV69Gazi
	XLyw353tcX5YW+wNP2IvMtXAXwzu9VAfUgoDjQOwJWlz3uQzeRjgrFwyhTAiDUy4
	lAYuadNcCVsTEKrl0KvE1cTgMFAF+fZ5avF80rYHoVcTDo2O60bStr4pGV6F7C9Z
	TSMmXBNy6PwNvXsElf1V5ZZWBjcn3Xt8sue+lnYweqJHQko0XFVX1XEjbAj53o+k
	T3/IUXrP60gxOvEAchwPcZKANiYjmVI4WBj5Cgh9fuLBzw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dv1fm8em-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:42:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b07b90d5cdso53527191cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908932; x=1755513732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qUBFM4nwPLNpeQX8mDV+PjWqifSyvBHQ3VDet7iAq8=;
        b=M2zct1E6a1boqOrMnhlxLUuaKBMa+lubE1OcZjZN2V6/KR2AfaZfUU8l1o+XS1c6vq
         G2npNkAoNRfvabp0B4FCmORTRgYkRNu5GMD6azBF084rPTOemvyLXQ5xSo7ZpAXlgm3S
         fd26e+yjV3vt/PxATEKTXP0lHsZiH2hbBQrZ0XthxkeS/6oMSiITMqEtBNjeMjegFQwM
         bjcUBKriKM2bzHaP1E3ZvsB6CU2Ugz5zm6ew3cPqXnyZHRwBvq7oOZEytDLOP3e4LjqM
         g9I05EJluxw2lsLQMqvXYl1ytrd9l1Itif+OIsoR7E1zvD4k+TScpjJI9wo8G7BXP3/b
         nrDw==
X-Forwarded-Encrypted: i=1; AJvYcCUHyO5xiWeZZgb710ryP74x/xX8fyNSzl89WTg8nRZ7zohvlft7OjBVPi0nfGc8LQ2ccDTtjv1/Rp2dlHd2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy++Rfz6D5YBHHmX2NP/ex3hl5L2GVN0nU6Mzazs3lU0TBES+ME
	u2pAImyWNqW8IN6JQAD0zRT63f6c3jO8VtdT5pR7AhfXhYpQt4/lGpL/gOPkuVRDm581AFBRNx2
	v1pRrVblyD4LzenV3X7IXoNQ7K3pEWGCBLB9TstfiZtLN2U4FU3HKkQYHalyDqqy4lBdx
X-Gm-Gg: ASbGncsuIBuMTcOS/I2PnZLoLyWa0E+3Critpl9CUJAsWjOriF5ZTzKuu1p2RzFXppt
	53WSPyB0bwNr3ZJdF3kJxHJfwAt9LAUrsgamqXbuyzB1TSIar4Thq/MAslmloNzbLxOfWg5Irut
	PVPCv8FYKsoT5YMd0q2GLLqyA8v6850p6KngVUK5OOYAOaWIa2xlzn6JjWPofqGnPZqsLGhi0Fg
	hAFsK+jk3pFRKHyzJSzsNBo0NlE04WYMtlMA/JXDz1LfCON/fJR/Vs69wdL7wY0VSvqmdomIBgI
	/lNN3R7xdaMbzcqE/fjmcgbfJQKgGbb0J+/DsjaUyeGyZCnnabwnejGEz2GMo/0ebzIuTZOnJJp
	2x789I4WswdSz9wZ4HjcODL6hWsG8chOgqKuIGIuphpICy8unmgrL
X-Received: by 2002:a05:622a:228b:b0:4b0:863b:f4e5 with SMTP id d75a77b69052e-4b0c97460f4mr73203931cf.33.1754908932128;
        Mon, 11 Aug 2025 03:42:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELrav4533j+uvOnzVBe8xzk6N6rVbp+g4DT4hCXZsWxjgBxbE8yTLhqAz+7n7euXWDM2dFgA==
X-Received: by 2002:a05:622a:228b:b0:4b0:863b:f4e5 with SMTP id d75a77b69052e-4b0c97460f4mr73203741cf.33.1754908931719;
        Mon, 11 Aug 2025 03:42:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332385b11d8sm44123051fa.38.2025.08.11.03.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:42:09 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:42:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_kuiw@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: sm6150: Add ADSP and CDSP fastrpc
 nodes
Message-ID: <wf6kf6u3q6na6abvev75bvg7h5nmn6hqvdljvip2ppmk5hkt5w@u7r52cd4q3b7>
References: <20250729031259.4190916-1-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729031259.4190916-1-quic_lxu5@quicinc.com>
X-Proofpoint-GUID: pXwWSm29UCsEKvqr2XqbSAzOT4JwvELi
X-Authority-Analysis: v=2.4 cv=cLTgskeN c=1 sm=1 tr=0 ts=6899c905 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=HRKZ4ecyPLDWXoXHFa0A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMyBTYWx0ZWRfX+nwl4+Wyoltm
 Hbk31P7iVWyAjvo+wkS9L/mOJwOjYlCCofeYN33NraLEUwFAEtKiVJe/iW3xkmDc2wv7t8pb95T
 /5vQSTnlJj6/4WN6FUstpegTEfP8e2XY0kNLehJRvRcecGtj8cOfgCGySyS5ftpmmKYkWb0xtIx
 ewiwJM+42P6WmllIivaVvwUMYUw3cYzYoHwHib2hULcQZIeMOXSPNyN7UP+Kfx1NjcIg1sa3U66
 JEL63bl7gMveP7KdvYnjmDic8szLN8lTxFKFExlZBj/WfTF5WkxsHxtErjN2jsI39+M9moFsBfj
 gFYiGsHbK1RRPPW8SzIzjRBT3gNbqHVOjof3442eOEVDvfYckAPnBkFjvWM0XMwvLK6sHT9PsPg
 rKctHakH
X-Proofpoint-ORIG-GUID: pXwWSm29UCsEKvqr2XqbSAzOT4JwvELi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090003

On Tue, Jul 29, 2025 at 08:42:59AM +0530, Ling Xu wrote:
> Add ADSP and CDSP fastrpc nodes for SM6150 platform.
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
> V2 -> v3:
>   - Add nsessions.
> patch [v2]: https://lore.kernel.org/linux-arm-msm/20250703055532.2199477-1-quic_lxu5@quicinc.com/
> v1 -> v2:
>   - resend patch.
> Patch [v1]: https://lore.kernel.org/linux-arm-msm/20250523103853.1538813-1-quic_lxu5@quicinc.com/
> ---
>  arch/arm64/boot/dts/qcom/sm6150.dtsi | 87 ++++++++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

