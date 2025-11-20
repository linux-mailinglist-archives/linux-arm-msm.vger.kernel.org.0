Return-Path: <linux-arm-msm+bounces-82660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A22BCC738C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 11:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7438B4E9813
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 10:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0161232E6B3;
	Thu, 20 Nov 2025 10:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iq5C0V0g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TquIOzLv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7F832F745
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 10:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763635607; cv=none; b=aCM2HxlMM4XmCHN8sPxpLAtQzqqEbAqq9YI1E6lMygrEFQEEaTDf/H2fEboV4xzFos4f/zZPcuiJA11EABdZQq2zvj0cMnnoDTnn/aRM/fgigY8ZnqaqvGCvct/Io0Ehf16aTHj81pITnShdv3t63ZLpHA9Zjk7ccf53Y+slJeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763635607; c=relaxed/simple;
	bh=dtcj/fK28CMYkn7bqDE4olGhzJw3gr0b3X61BTO6DFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IgDTzsmXmIEemvWa8vVxWs30zxtg2GAopWgQMriD5aXx/OoJNwM4lSPfjQdxM09clGtI/u4D1lnNDKPRLWcjfQnhaA73UBe4NSZoQyQCRADTpBaOueZyYb43E0zqoHZbTIudsWzB/pZV72q3pkCOz9dPh92BqITMvHuKNxdSETk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iq5C0V0g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TquIOzLv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK56O7A4026181
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 10:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lp+724ZMakvM8pZxZghEF1kk
	SgglYIzK0fIyjyx/k9s=; b=iq5C0V0g/2B62wS9v/Jj0YFptw8v9Rt9JHdHocZg
	gMI7CjR/mupSijgCnGK1/HEPMQIvEas5Jl2mCICZzctFIp8+T+1M0hCtOE+lTEop
	YAQv6rXhCDbZ7KsIPeJfmDd3o/+ULrxYEmPimDlrTTYdvgXyOl3i2oDBb4StBz/Z
	hOuAJk+wJ5krwz9lKlWLQ6+tThD91Or+nlTAL/peTmqDxOrjYnvegBXuPxh2wBQm
	a+lQTcJlpDwLl5v9gy1g8OmzFRdi12Vd/eW0yiNw1Z68rDYmMDKFB1gIcM8gnkxU
	+wx4NxNHO3QWxVcjRpwioLjXeaKMTAZN6J242jLAq9qxjg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahvj3h176-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 10:46:44 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7c70546acd9so2223660a34.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 02:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763635604; x=1764240404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lp+724ZMakvM8pZxZghEF1kkSgglYIzK0fIyjyx/k9s=;
        b=TquIOzLvxBjm/ARwieP6dpTN1d3+dpIxG6Xd9nSXzhH2KCHqci/Bd/HGlTgNTDVP96
         FqB8bBca4UFNkB80FYzmlWNVVhFitf2Xc6HzWUHGU64AVw1JqU4X7nNLrOhpcfltI/DX
         fmnoJURknv61fPbs1pOeEn/LBdqQ+pKiGQeMrgQ3fFC2kI3LXK8qGsWS/cWQ6Xp002ea
         zff4tDO7TPsT0AwR5zbPuVPht8t0zugSDY7ICEIAZoy5G24ZvFdOJnoTj4fp7meMo3kP
         0E+60ku8zOVwUYCvlx9wqPdqV7qCHeBpVUtHHTVLid+iNh9MVN3uUxAKSHQfCd4QuvCp
         dx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763635604; x=1764240404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lp+724ZMakvM8pZxZghEF1kkSgglYIzK0fIyjyx/k9s=;
        b=ZN2lqfbTf6subu6Zx9qCGT7nAPX3kJFWYGXVDxmmgvRiuwKmieiokGHlEKomfVV5eB
         fHF4V6+8c5J7j7MGBa+jUWSsbmGVkFy0L1dNrETWq+Tf7GhfjcyFv6fsD7BZ1yM7bYT6
         NlFSSlT6ls7MThfGYBAalAP/eiVSTBuzuBgvhhXWrDom5PprqjcKQMF8xy8mtMoSA4PQ
         oEG+RRNT2lcLUx8ilasD1D3ueoBCADZ69o9FVUoFAbBtd7Na5BCPE7KhR6DEXNQoyD2M
         SKrokS4n7fKiYC0jfGHCW6OHTzb/znimAvxTJcVX0IauoUhnOzyme3Dy4u3VXTVbyTmU
         lOhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzbIS2KVJKr9qe20sBWJF0O8mn3tMBswVtN2a6UCCsRG0cNoA31SWpt33G6gQxx5GyMmM+pfdV+VCDe4JV@vger.kernel.org
X-Gm-Message-State: AOJu0YyxpuSu6yj6wABJ5Vk5IOgOKIbDM8Q1mQsvOp5kvN8SR0wZlbEL
	qLDpduO5stNlWjNgOl38SMTrObqWCBf7apHWhOjg4csRn2uZhQeSN8yBkS3z0IDvFrKvkCyFg71
	XlGiHJJj0MEK2AVwTlu3vq9jL776HVec/nkc39//Bnj8nYyRmCb5jk7rebwl9WSz8GUnd
X-Gm-Gg: ASbGncvED8sseygweEEf0fWPUt4t26h6gwMk4Wr1C5kol3MWsoDSlG1g+h/aLCVjLTk
	3QMiVeqJILI2gWQhLfWr/NUAorojQtPA2jCLH8vYj37wya3wjqc/2E7Pql7ywK6g/WYoTivkgJ6
	AgernrAZEFtSwJKDaxJLfJqzVIHqql+i0uDR2QSVUzhQ52xc4mWC1ts9I1EuyzBwcBnbcsFQZKE
	ln19Y4Qw47/SETsThnMjpSecXkHkLJN8XHsVn+S7Cc/0k4P1zgaWOITzWkO1Ov+diHVdB6rEeCB
	JjO4B0XKTLQSORnM2s+3CaNHrfRPKehh6xmpaWCsn3v8T3vL+OE5muVSmP/QvmiIw02j1GyIta2
	n9FJDh69OZ2feFn+clx4rWJxQityAB92aZMHRWe5p6ULCfXJXFVSXTG7C
X-Received: by 2002:a05:6830:6112:b0:7c7:1f5:28a with SMTP id 46e09a7af769-7c78d275311mr1556713a34.12.1763635604427;
        Thu, 20 Nov 2025 02:46:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEY+qfL1NsEbK2LIjBLgVXMLq61CmQzatTIZHySSAokZ3KEahg1dA/+XpdJuLyDPLwT1FKw3g==
X-Received: by 2002:a05:6830:6112:b0:7c7:1f5:28a with SMTP id 46e09a7af769-7c78d275311mr1556706a34.12.1763635604092;
        Thu, 20 Nov 2025 02:46:44 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c78d346d84sm851828a34.13.2025.11.20.02.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 02:46:43 -0800 (PST)
Date: Thu, 20 Nov 2025 02:46:41 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
        Wenbin Yao <wenbin.yao@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v6 0/3] Add support for Glymur PCIe Gen5 x4
Message-ID: <aR7xkSWWLoGX1HYn@hu-qianyu-lv.qualcomm.com>
References: <20251103-glymur-pcie-upstream-v6-0-18a5e0a538dc@oss.qualcomm.com>
 <aRyoo2Ve_hjgc84M@vaman>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRyoo2Ve_hjgc84M@vaman>
X-Authority-Analysis: v=2.4 cv=J8WnLQnS c=1 sm=1 tr=0 ts=691ef195 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=HY-MMhiuUmRCiokpfk8A:9 a=CjuIK1q_8ugA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: XZ_QGixXigZ7cuKJMCnKla7p28adCD8l
X-Proofpoint-ORIG-GUID: XZ_QGixXigZ7cuKJMCnKla7p28adCD8l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA2NiBTYWx0ZWRfX7rT5fSEZAXTE
 dSR6p/VWepGQuNLTfZ3ohHrG7SG3p17046/Q9rhuo/eL/gjBPc21Yp1Vn+t6LkAoB/rQ0etJ8EN
 l3ZbI1MH+WqORcJV9rIof2SvDv4GqDOg04/bwDEbeXluITroY+yQRdQvNjjh2foR70xR9fS4fns
 u+SA0NO8iLyxb2FdNm4bzvQWmrJqPlBMgAXRgvgzBTWDLl3+B4FRbmI1grmeuBwpRU0G24pJodR
 3O2YwDrBC0Jqi8nXrq+y6WhDbsCRTWgnUs5lEngR7x8Scpeacjd71yNldUdgL7yz6URihD0wBS9
 JF1iNSMiXEdQjoYPBSv4rpNJWSpsdjCC2blJSalfk4G8M+cAZaI4VW8FXOXifHEZfEcRVlSHOsA
 WZvSAOUmIxSKMVowY7zELeCugHT35Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200066

On Tue, Nov 18, 2025 at 10:40:59PM +0530, Vinod Koul wrote:
> On 03-11-25, 23:56, Qiang Yu wrote:
> > Glymur is the next generation compute SoC of Qualcomm. This patch series
> > aims to add support for the fourth, fifth and sixth PCIe instance on it.
> > The fifth PCIe instance on Glymur has a Gen5 4-lane PHY and fourth, fifth
> > and sixth PCIe instance have a Gen5 2-lane PHY.
> > 
> > The device tree changes and whatever driver patches that are not part of
> > this patch series will be posted separately after official announcement of
> > the SOC.
> 
> Please rebase on phy/next, this does not apply for me

Hi Vinod

This patch serie depends on
https://lore.kernel.org/all/20251017045919.34599-2-krzysztof.kozlowski@linaro.org/

Can you please review and apply above patch first.

- Qiang Yu
> 
> -- 
> ~Vinod

