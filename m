Return-Path: <linux-arm-msm+bounces-75525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E54BAAF6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 04:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAEBE189BD9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 02:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A058B212556;
	Tue, 30 Sep 2025 02:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XDqAC9vP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389C020B21E
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 02:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759198474; cv=none; b=bMEGmklHoDq0VEpYmTjEW/GZ/aDqkR3GYOCoPFUc0eIXVVuqAh+LMvOa0AdiLRY5bxOQUJYOGNX0MbW45vkCuU9xalrP9xKC6mIjuCfoluEIgTM8MwmwAgLRzhwrrC0WWUye1+hChb07fiH55RCCezU+Xs0YsFRIpSZEo70JUzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759198474; c=relaxed/simple;
	bh=0ngWcEco0qDg9qk7bC4+kZtVSJ2EuBN9iRGJM8tgvLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6BiASajXRc37ITX4SlnwIV93Dj3P/7pkmNi5eLGI+eYkf6sceq06PkAX+hPQHCOolxdsEKwVZBy2dp69eTTxJH40jwIW+8I9qNY47g8kYwUhgbEJitJcLR5APeqUw6Iw8b9IcqyxmjtETHeAFGJ7Nu15THNYeVLcQJzT+P6R64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XDqAC9vP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58TJndtR008485
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 02:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=67Xqvmd2uK3auGbMcyGYLT9E
	R5OLeu3AxM4ED8FfyfQ=; b=XDqAC9vPb0ZnrWQwWg+mjyZEHs3tTdrT3efg1oI2
	l8jX3Mrm4807UEADgFaeUO0g/pfhZDyrPGH5lBkt0IAoqT9uuLKbNZRUR17024iB
	YHSBquUnIIvHFVZzph/vsEEe6SUBW3KDRxQJbzDks/5TuOxUzlKpDitirYYPFC/p
	S7n7+mtRsyNy4MpHEtx2sFshuieQVfRj8Y/qECSWjR1nBUviCbx5XroCbkKN6nCV
	iR/KO2qut/Rl/j7GO0owgf9o1JGaX0U+S8bBwMBFbIaVZlWPdaBKIRvZSB40UROk
	NktQKVqyBNsQ4XHsjwc3KeyEBmjxcLEk3FqeEn8czVT9Hg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdf3n9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 02:14:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d91b91b6f8so87427751cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 19:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759198471; x=1759803271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67Xqvmd2uK3auGbMcyGYLT9ER5OLeu3AxM4ED8FfyfQ=;
        b=jGhtIRtlyu4HQfsfAm5VH95APiO7TtZ68VNaCUB8nOmz8r20hJpWvAZ5f/cm/TpXk4
         jtUDIeaLuGrMEFS/a4tn9Cz1dSVaAhPwcsBw5kcfNVesO4+0YfbMvlwK/AeMK7Jd53Pj
         d9Mxt/Mf3hOyKcgvct2cNLPiJ9LeyPFClfiIsG+xlaxxiKbg/YV2V/4/PtwDeYDxz14U
         drhO2TP0n2RUSH2fjKd6Ed/TIvZW3sEO4ymruK6JFmpQHtRxUFp/QJU/fmysDdZAyTDR
         OOkPXZmc7btgeNLv8Hjj0y+PqNhoicFfe8e7GZxBi8zH9lVVdV0Y24zCh3NickAq/NKI
         +5qg==
X-Forwarded-Encrypted: i=1; AJvYcCXYNYtmvVa68EgKLwRB1/Z/NtwrgIitYeTVYC+qdMT5a3QaU0NcyAH+1WEOpx/zThPeqfGKRylzEb0YQeqi@vger.kernel.org
X-Gm-Message-State: AOJu0YxPD6cg/UgF/DLakza7mC3G9dok0Y9ZRMNOLRv7c/WCpZ8zeMV0
	SzNxqgjjOWibAHcfMjUi3mLUuxOz49i6jtr2+oIkSvQ3sYsbXXIwuIV1j8K8kCeGbsYQMsbK80S
	EcB4t128hDlno246ZEwa0sFb0U7+Zv9UDoHuDq45s/cQMmvi9IwfNXlEOJCHpJx7i25Pj
X-Gm-Gg: ASbGncvOtuQvQqkUptZxVR9V0askVN6DTHU8XQ+H7FL0JMHQvd2GxvV1gEPbS80X6dP
	egNxiFOzAZtMnwLowN/byxD5B5AdP9tQeqamdrnl2CveGmIhKlVzvkSSBAC3Nip/loHooj9s8kn
	v+Il+Aeh5f/vWXlOrqlOlgrq3KQv/fwxs5Sa5z/qM3a6KHtVQ63bfe86A5H70q0V93cpWp0itBM
	f4tXSU02/bAN6iLNXYSq/yS6+75b/2Owri/BgFAy4izgMzcIcVTZ06WIkXp6kh2VvOdwRi8DvcZ
	PEd4MfaV5/cHhQ1FsehiOIKICIMk/2OP5x1SNyZ6H9dEhE26QefsaxCcjIvp8AW2v1XAsSoIHig
	KcflONdLuBrCST8v3Pv1G3skB2xuEXCFFqWFZNqAJANmspuQdaPZq5SIDog==
X-Received: by 2002:ac8:640f:0:b0:4de:3960:948e with SMTP id d75a77b69052e-4de39609bb1mr134148041cf.32.1759198470883;
        Mon, 29 Sep 2025 19:14:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoZE271MUjmzTd9Ph7H9oimXFoXuH9FPUmIkhkdYnBZBqrJ5NhepXLT0DpKosAl+lJBDbZHA==
X-Received: by 2002:ac8:640f:0:b0:4de:3960:948e with SMTP id d75a77b69052e-4de39609bb1mr134147871cf.32.1759198470283;
        Mon, 29 Sep 2025 19:14:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-586b0c1fc85sm1897636e87.64.2025.09.29.19.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:14:28 -0700 (PDT)
Date: Tue, 30 Sep 2025 05:14:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: qcom: socinfo: arrange the socinfo_image_names
 array in alphabetical order
Message-ID: <hb3ia7ltrr3qeqqj26xm4zfsbkc3wc77juzstisgultcdelray@fzc5p42xeqnb>
References: <20250929-image_crm-v1-0-e06530c42357@oss.qualcomm.com>
 <20250929-image_crm-v1-1-e06530c42357@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929-image_crm-v1-1-e06530c42357@oss.qualcomm.com>
X-Proofpoint-GUID: _mFpeREQg_eDbAGxeNyhsnuVgpO_QKzQ
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68db3d08 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=pb4uCXql-ON9smFTI5wA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: _mFpeREQg_eDbAGxeNyhsnuVgpO_QKzQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfX+HBMPNzS8OF0
 iABWb/BWeFpyTeosMfRGFfk0qVzWFlR3F3hbuJKyqMTJUpMt6CXA0S3GQOeV7ScByooaIdeom15
 YG+kZ6Pwg2s9jSXUa7h2MgbDhhPp6LWmxVBNDdmMNdc2fypl+D6P/CFo558dwFA6waYtyDY2aXW
 RFoizSC2dq7cUUSdCSzmTz4Pb4q2YuemFp3EPodqercKB9C2gZG7cklLcyBEWmDG8ETNiLX3l7t
 GS4FB/LoPsQLlhNA9XJjedaBFAJQ+yS2ri+5Co1Tu272JhPoh1kUNzhiEEHxpqKD1cPcemUieX3
 vJq72583CVwmNwdv9JkoVVDgDGbysWoh3jrbslmGnhXKq6LjuI63n+GQxCeB0o3XbQO7gq91I1g
 zfKLqAxEIxihW1TttDo5y7bWpe6tew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_08,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036

On Mon, Sep 29, 2025 at 07:47:07PM +0530, Kathiravan Thirumoorthy wrote:
> The socinfo_image_names array is currently neither arranged alphabetically
> nor by image index values, making it harder to maintain. Reorder the array
> alphabetically to improve readability and simplify the addition of new
> entries.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/socinfo.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

