Return-Path: <linux-arm-msm+bounces-58359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E61CABB2C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 03:07:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C66053AF0DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 01:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E821519BF;
	Mon, 19 May 2025 01:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZsviGbt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F35B13EFF3
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 01:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747616831; cv=none; b=Bz2/KgBe3psfvAkxcpJJRTdNpbdUSqNH/IOh8Ng7fgqOILLKWXnPDKNIv+YbZ34NuT+is8G+vd8UoucpBMGMze9I9LmUFMCOqkXUgD3gI3afHOs4wOStXHN3cafIQG2le6u55W52ZSUnPxmKtpzmCZcfvy5c6OwZRLa8QYScDFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747616831; c=relaxed/simple;
	bh=u3coNIEXcwpQF3VClyn+QPxuX3xpkCJDAeCZxa9HiA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SdD/9vxsZIja5ZRrkAzGKRZJ8fNfnRspKAb92lc2TnzPbLJqNQ9/Fr0Qx5n6feWDU6kFJF4l9q2Mp2HgeItdsZ6a3pVcv2QlKZJzxY0DMhL1HuXqfK9ucqA5W6SAzlGftlSUb7SyrZTpNflbPhYTRyOZHu0Thf/iZ6nalLkFWQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VZsviGbt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ILNqIQ028604
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 01:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9NaSP65lkazc1pMW1ainLK3h
	J0x0G4klMCtgn2cCzbg=; b=VZsviGbturYRMZsqYAxoR+//1K79EaiMXT55ntD1
	f1EAv3eR+B8zpw05vAgQC6WrHac3JpMOUyKMY1nd8wBpoo08kmEzTQ5Viu6k9y3C
	JjKSjWKDzql7Daiz1Ng04Nv5dpqEhmvXG0EMXy4eEQBjc+nK0olJ+sgAI5S4wjx7
	zeaNPkaj2QSwHAj0OH9t6mYM3kpe8e3Te0klX6vgLYf8O+3rPygvd0DtxaOzYfu7
	niivAisE8nPtgs0+GyM17+AuVxZzBwjrT8DJ+9aUZ2qhm2BETVP7bDRlCosb9T7v
	4kv5Iavv5VYEovKQzhUiaps7Nl38qyF4xaXowQ1Cm//vmA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7an29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 01:07:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f6e7c6a3fbso85915616d6.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 18:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747616828; x=1748221628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NaSP65lkazc1pMW1ainLK3hJ0x0G4klMCtgn2cCzbg=;
        b=jqI17UPm+B7WQ8U4XojuveGRXg7FGeTwXgLqenD7aRT3ypjtvRQ1ls4eEciS/G0V04
         hV6PdKlpFzeu8ooaUJTzFVgYGjqGclUnmqRwNOgYATcSUCexn/lifeYF7ymxXxOs/upa
         BswJCAWe4z7OzjI4fiQKLhg5w9dxME4hOiK8jo5Thc9owfP1djD80UpcM+T2Ez4hKz0o
         yvk7kX4s1C5yjsEEi0g4BEwy04I4L3D4bR61uiVh3U3fLqcZYToLdNAwYJw15ojWQsdE
         K2bSBJikGWAxx7d6o0YnNedJgV2ZSbUYDswH1kGIDkyCFaD4RmCe0diuaziJlN4GIruY
         tuTA==
X-Forwarded-Encrypted: i=1; AJvYcCURZ++Fkc/k0Ox+aUJm9cMLOUFgpzpE9UvV4AJtdYbnM8JYOGXyFga7av47wr+OB9gI7IcyLdsDzmqX6wD8@vger.kernel.org
X-Gm-Message-State: AOJu0YyLtMFo86/En4SvfQ2OZHIY4xokdkaTLyHvsSferLAivBwKMRD8
	I00vh6Z7c4fXlDzmyztg2t9nsWezhfRewDS3GUDgyxcQHPUrALq/N4f2I/KqmDlWj8zPUl4xfzh
	VrEinl+r4s9tNTEpeKSA08SI03U+3KuD0/0OyzGTB52ZRUmqzuZ+VtHbAMQ5YFuc5ZpSH
X-Gm-Gg: ASbGncsrUT0mHB8gkeS/Iu4Ag+CZDnKfLotFz4HOWgLLvjvhZCpf0HzGT8oNeOXR4sk
	zPLN1UbJ5z3DeetSDEwqLmzf/zxQ3uH5tVz7JE0u/QQudaQORfdmNgfKi0fTj4DOWrlfsrIRBQH
	pULLk/XuG2IOqoa5koAkn86HNj42l+mtSOidaMV+DKbEmlWisvMkMeagTz3MRI1jhUZ38X2620A
	dPOH8PDnsrAFnVxP/+kypxxOVemktMkI7Ne7QaRRXyC0bhrLyboKLoZ0Yj2UOMAfaXtxl5DLI0l
	54tyrzH0siJALMT3EKyzz2E1cJwWm8eU/LPxQ38YDnF3j1SBrQmCJ0nN0tsPu/d026HezfgvDzE
	=
X-Received: by 2002:a05:6214:2428:b0:6ea:d629:f47d with SMTP id 6a1803df08f44-6f8b08f9a5bmr185310296d6.44.1747616827894;
        Sun, 18 May 2025 18:07:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqSJk/SqdkBbYqLR2IEs/FtCzb710T2GK5kX1TaRaCIGQhWa06z2VX/5aEjyY122E/NinQbg==
X-Received: by 2002:a05:6214:2428:b0:6ea:d629:f47d with SMTP id 6a1803df08f44-6f8b08f9a5bmr185309936d6.44.1747616827515;
        Sun, 18 May 2025 18:07:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f350b9sm1619828e87.94.2025.05.18.18.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 18:07:06 -0700 (PDT)
Date: Mon, 19 May 2025 04:07:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sayali Lokhande <quic_sayalil@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add UFS support for qcs9075 IQ-9075-EVK
Message-ID: <bhu7ifrgg4fgy56lc3ix37drxyciyzl46qkicv6lr4svjejcgi@dqdv63ogxtjr>
References: <20250513084309.10275-1-quic_sayalil@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513084309.10275-1-quic_sayalil@quicinc.com>
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682a843c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=tguQkwLf3mHSJAPor5UA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: abmM9gRM98ZwmPclLTYiVe8SE1dh02H5
X-Proofpoint-GUID: abmM9gRM98ZwmPclLTYiVe8SE1dh02H5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDAwNyBTYWx0ZWRfX9VYhitxO9TWp
 85n0RDDLGoQLEtQ8OV2aPJ08YjRL8ud/O9QULuazUhc6YYhA2cVbJNqrLpjjkvfo/8ljw2iWTS5
 XXWOM+4OsbJr1KZaXoFDyy2bXdvA2d/12gz4ez5Ib6feMfVlv/VBNBqwDYehDmObZWgm0tpWOju
 KpWeNgATblt76HKnGjxXS69Tpo3aZt5B493fXIxN491tSaIaJq6lpAt3fxtxXAym/AQaURAUFW8
 TI+omrp5WIYNYr+ZyFYyuHmxOrpPZwXIe2j9uzZNzwo86WrUHqdFQLODeTn5pAyQnfZbHrVzNsX
 J+niVG9U95NM6apd2P25EGKcsmAii89VTdHFr/dGjSurs4hKzCnStf5oK/eb0so6ljtDxoMDSFE
 6TU5AycipfYIZSMcerzlRRn9ksilWVmJm3d1TJoqJOKnV5i16wgNUG8sqZMAyf5fTtd88/Bg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_12,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=846 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190007

On Tue, May 13, 2025 at 02:13:07PM +0530, Sayali Lokhande wrote:
> Add UFS support for qcs9075 IQ-9075-EVK.
> 
> Rakesh Kota (1):
>   arm64: dts: qcom: Add support L4C LDO for qcs9075 IQ-9075-EVK
> 
> Sayali Lokhande (1):
>   arm64: dts: qcom: Add UFS support for qcs9075 IQ-9075-EVK
> 
>  .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> Please note this change is dependent on [1] which add
> qcs9075 IQ-9075-EVK board support.

Please squash it into the original patch.

> 
> [1] https://lore.kernel.org/all/20250429054906.113317-5-quic_wasimn@quicinc.com/
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

-- 
With best wishes
Dmitry

