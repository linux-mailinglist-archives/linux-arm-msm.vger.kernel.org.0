Return-Path: <linux-arm-msm+bounces-70122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACCFB2F4B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 11:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A6DF3B8FBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 09:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85BA52DCF77;
	Thu, 21 Aug 2025 09:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GEKIUoI0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F162DC332
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 09:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755770253; cv=none; b=edljqulW9w6/fPT66q4A1oMybx7e0g47LfZU5DnNFkOMiQcRme8FOFTWhzoEQjd1kRXsewC99TDf82h4isIGL2ToHetfYVa9HyWS5PkZsc7PznpcE+PxRKxk/36ccaSS9NPBzcez/WY+OaFzt/rglrOdsxuITSpijTmijiQkNGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755770253; c=relaxed/simple;
	bh=vy2/4IDxVTP8B1054laffR6LkPGsxI0lLeNGiepTPwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/7jKwvOkt2AZBDHWiEsiD6BkwfbOpnPPJku5+xucLonxJZp15hKo9KfYut8mSG7JpIdEhaRicnNVHdsCAP7riH3OWJIu0VpCbDEYwEgQ1uD+gnCv6Rjn0GEkcePY+bg9HOKbJScLPleoHfFR+qQne69N8u6cJdSA4b26AosfVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GEKIUoI0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bC5k015272
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 09:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g7PwJmWud4LLm5PEBKc0rhlg
	wmfYyGE456fNQ+YMjxI=; b=GEKIUoI0KrJX3ctpuKhvi/fCWZUkiKZNzLnRXHmA
	RF790C7FnptHnL8LvovYOR9qsce3k5T+jFLaHV+KgJLVyh4FQpJQG3O8gB9htIMP
	EX8bHOnCEamW0p6jclZb4yg3W78A5fbTLf3zJlstXJeciAl7ahRKFxurfIxxgH0w
	F2Ql9/N7HtQSwqL8FcvTbcmXfh4G1XUYlWNI1Hsi+bVG1TdE1Eav6nrJoGAgpqME
	MbAK8asuZKKaeRtz18XTy5RR9LuggXf2OtanGCCI33iCaUOnFXXQQpr0KCTEaEpw
	d2CIXgTFqB7oCEcJ68F2aJQSBEHSNjqNCpVMUBqwF0m8bQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52cn0m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 09:57:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a928da763so18024856d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 02:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755770250; x=1756375050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7PwJmWud4LLm5PEBKc0rhlgwmfYyGE456fNQ+YMjxI=;
        b=kb0GwumhN8gKwGFYC7pyAqmfHI1hVe22oIfPSbR2XlFfu9LYAPLBpOazhj7Hbt09Zk
         T4JFjJHbLDsuyNA67QFNybclhnbqZZQ+wp12bjEyikzAcK96eP6RTmqROAYILxy75xU3
         EOqlJnSGWe1fHkO5uVT8GkbcdPtirdNM0jIUpXIHjQxlko1BTnu6HdrtKM2MhTu3hqcH
         nwwZzQLujAF1aE0iBgpRUCu+WYpxNOLNdaEIq+KnmKiF+MyRD1eDV+5ekL+29kQ/pzps
         GQ2GnomCcYaZMkCfUenkO++s5QetrBC45xBO073TIraGFiTVINk7pII/pvSq37a1mVEJ
         5bsw==
X-Forwarded-Encrypted: i=1; AJvYcCX9Fx22YHWsUbRa+kTYeQrusQuLqa5kZAe6mErT6+TcBP3HBsIBgSG4KETiaIybOEFKUcfafy6KBCDCzDmv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw752mCjs18ri/AXrVbvFjiAhiIvDIAG/l3gLLqmeLQZV6knUCd
	KLskfEhs04rpfNrahLpn3a1yeAsLDBi5zApoJ9Nb+dHffIK7kpFQOg7yUT0iSzMVtHNBvOCryX4
	xv1nAry84hXjlC85Pp853u9hyMKmP6Q+XiqFQH6lKvvsMFO5nxtrJ9HpmWv630wTUYfWI
X-Gm-Gg: ASbGncu7oZRVayeP1ToGOfnjfkiA8jQ0Z2carVuhb+vc8FHkByW3Lu9XLqTmuLo9HWr
	PEbDDsPmNS1bPzD9vxJZOvFDUNpAWwqinqpYsrCYkekW15DLrZhW8FyplzyVOobt1TzuN7JvvXx
	gHe1jbEmP2urDA6VFSbHDqqM0l1Qg9qTt64Y2PXKN+LHWLzrdypMMvH9ICARBdZIDRjnLDd97Z+
	ZP49vmkpl/OJkgqO3REFNw09iSDObCVIv11k7rwikHMTU0z4vSDy9J/dLaw5au+ftzsyqzieEwH
	v9i8mK0oW7B2znSSFm8wrEm56VivCuU2KokBZs4Zh3yumVwLYTzfBJj3CHEQu1OB89+jMMvS18n
	RjP3GVFBQwjCX5rUizVGZzuzIN376nohYNUTNcUdImp/9jX8mUc2j
X-Received: by 2002:a05:6214:c82:b0:707:76a8:ee9d with SMTP id 6a1803df08f44-70d8904ec58mr14210296d6.51.1755770249839;
        Thu, 21 Aug 2025 02:57:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOEFy709p/UfP4jm6FhUpBzgWM0SGkek8iTlc5fP6qfmNzP7NFOaAd+rkmJecj03zIVotF/A==
X-Received: by 2002:a05:6214:c82:b0:707:76a8:ee9d with SMTP id 6a1803df08f44-70d8904ec58mr14210196d6.51.1755770249441;
        Thu, 21 Aug 2025 02:57:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a41d325sm30632461fa.5.2025.08.21.02.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 02:57:28 -0700 (PDT)
Date: Thu, 21 Aug 2025 12:57:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Subject: Re: [PATCH v2 3/4] phy: qcom-qmp: pcs: Add v8.50 register offsets
Message-ID: <utakatkrxgfggm2fo3rtg3w3t43vibqaomnwfsp5wi6okuxv62@sdsx74667hgz>
References: <20250821-glymur_pcie5-v2-0-cd516784ef20@oss.qualcomm.com>
 <20250821-glymur_pcie5-v2-3-cd516784ef20@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-glymur_pcie5-v2-3-cd516784ef20@oss.qualcomm.com>
X-Proofpoint-GUID: 2UqZGx0oKD2Zh9KnM5Kz3n0dWyC_kd6B
X-Proofpoint-ORIG-GUID: 2UqZGx0oKD2Zh9KnM5Kz3n0dWyC_kd6B
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a6ed8b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=oUcIdNJcVQQXXIIADcgA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX/OJ3frKh1Fsx
 6w0i73OS48BfufyjISLrSCKhfMArzazl6v6ZD4+GIKVJlO26ZAijtE/MiG/JiZwjUQfZwwiEpbG
 zQ/JAH27MWMrWYJ30nG2STIfgFuxD8K8MT4VMtQW46TpebVB+pgmauP7yfg08PAYyq7jsmsi0AF
 7gDPlDv2I//GRLxZr8Pnl37K/x+KtB5GtJugjPhTMdcYDMAAqaXuzuTr7aO1WJ+I4zZObEqes+l
 rVHui0Kgd6dbPkDFyx8A7rU+uBAJH4O/AWFGZSD6963Ogw1hKSIv+9hSENuPJXbUDRDWLqSa7N+
 xmfJyhT5fygmCXcMrlpWp8n9/ZRorhHEUAK3OF/Q/odlApj4hRximf5p5U6RDqM5POTPL/Em7ZR
 ID0jp1IRqDgXECpbsPCditSOqwv9hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Thu, Aug 21, 2025 at 02:44:30AM -0700, Wenbin Yao wrote:
> From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> 
> The new Glymur SoC bumps up the HW version of QMP phy to v8.50 for PCIE
> g5x4. Add the new PCS offsets in a dedicated header file.
> 
> Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8_50.h | 13 +++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h           |  2 ++
>  2 files changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

