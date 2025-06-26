Return-Path: <linux-arm-msm+bounces-62583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D44AE96B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 09:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7BD2164103
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 07:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE1923B613;
	Thu, 26 Jun 2025 07:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="oYaYAdbq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF91F1CAA92
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 07:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750922758; cv=none; b=QF/BwRrn3wFdG6uA9Ee67HQ+HL8QA8R6YgLojyqu0AdipWnHoI37OPsxZ1g398YUGjmDzYXHtONtN5PAzFPx9chSzRoZWlp9Fxstqb6RWf9pZognJIaVnp270fN7bwiKC3Mo0kjs4X+48O4jEJyQU8bc8ma0ciNRbJ1xAZX8MGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750922758; c=relaxed/simple;
	bh=zNyireIrzqQGlC1AL/TYgmGwJV4go/9nKXlAZ0XN3sY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=FbIQHQXbr9T+qUA2QomCg8ZyeEKdh34VMmfxaghvcLofDMwCuBh88DCsw/93cFuWvHHvLcYUiCyO0gCPgroarZpGU0NZkh8YzFFK0IfGphlSK/dS5AmY+duPXH+2HMcx9gxgQemjE2fVGVzu/3Lwx0AOSHYGEXegjgUSQZo41C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=oYaYAdbq; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250626072555euoutp02d3f9b49d2557fb04b3552dbe50dafe67~Mhvge7ms91413714137euoutp02P
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 07:25:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250626072555euoutp02d3f9b49d2557fb04b3552dbe50dafe67~Mhvge7ms91413714137euoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750922755;
	bh=icw0rjoptkxLHhnrH+Lv9R4VoB6E9eXahaqZ7CRog5w=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=oYaYAdbqKL2WtognhSMuMRAAXT0Y0KSf50dCqq6ukWVWB+IEaEeZEX8Eq9rmQOlb2
	 q5xpqqFu/gPa/Fz+zVkig/b6kYXFrH2+DK7CtkuoH/15VztfVkOAfI0CE9NENm03zy
	 noWlyH1JU8CoXW3Nfph5gUSxKMpqpdq4/OR76dOk=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250626072554eucas1p2ae35c30a96ab1ca61b6a3d6a970708ee~Mhvf-XwAx0141401414eucas1p2L;
	Thu, 26 Jun 2025 07:25:54 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250626072553eusmtip29447c0f000773f70ea184087c9f48365~MhveVcUnG2361923619eusmtip2e;
	Thu, 26 Jun 2025 07:25:53 +0000 (GMT)
Message-ID: <9cb6b7ad-387d-4a0d-9792-25cbbdc6dfed@samsung.com>
Date: Thu, 26 Jun 2025 09:25:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 10/10] scsi: ufs: qcom : Refactor phy_power_on/off
 calls
To: Nitin Rawat <quic_nitirawa@quicinc.com>, Aishwarya
	<aishwarya.tcv@arm.com>
Cc: James.Bottomley@HansenPartnership.com, andersson@kernel.org,
	bvanassche@acm.org, dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org,
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org, manivannan.sadhasivam@linaro.org,
	martin.petersen@oracle.com, neil.armstrong@linaro.org,
	quic_cang@quicinc.com, quic_rdwivedi@quicinc.com, vkoul@kernel.org,
	broonie@kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <7e362ee3-a237-4583-97fe-69ffc0d1d90d@quicinc.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250626072554eucas1p2ae35c30a96ab1ca61b6a3d6a970708ee
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250626072554eucas1p2ae35c30a96ab1ca61b6a3d6a970708ee
X-EPHeader: CA
X-CMS-RootMailID: 20250626072554eucas1p2ae35c30a96ab1ca61b6a3d6a970708ee
References: <9c846734-9267-442d-bba0-578d993650c1@quicinc.com>
	<20250620214408.11028-1-aishwarya.tcv@arm.com>
	<7e362ee3-a237-4583-97fe-69ffc0d1d90d@quicinc.com>
	<CGME20250626072554eucas1p2ae35c30a96ab1ca61b6a3d6a970708ee@eucas1p2.samsung.com>

On 21.06.2025 19:15, Nitin Rawat wrote:
>
> On 6/21/2025 3:14 AM, Aishwarya wrote:
>> Hi Nitin,
>>
>> To clarify — the defconfig kernel does boot successfully on our Arm64
>> Qualcomm platforms (RB5 and DB845C). However, starting from
>> next-20250613, we are seeing the following three test failures in the
>> `bootrr` baseline test in our CI environment:
>>
>>    - baseline.bootrr.scsi-disk-device0-probed
>>    - dmesg.alert
>>    - dmesg.emerg
>>
>
> Hi Aishwarya,
>
> Thanks for testing and reporting this issue. Can you please
> test with the attached fix and let me know if it helps.
>
I also stepped into this issue on the RB5 board and I confirm that that 
patch fixes it. Thanks!

Feel free to add:

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


