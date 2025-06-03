Return-Path: <linux-arm-msm+bounces-60122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3731ACC2B2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 11:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B419C7A7534
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 09:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD0E280035;
	Tue,  3 Jun 2025 09:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M9SHQhPC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53B52AEF1;
	Tue,  3 Jun 2025 09:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748941869; cv=none; b=WYrBLREC2/S93u1lbHmqaqJ7ltUTjYiAtN6N7rgCPE9uZ7LWNfvv5h9/a8+SHLYyZ6VrqoiaDTaBfS2TFpHZ9Bq7ZdtrgIQj8hX3FZbMqP9BC7mIuQYCghhLMOr2okD3/jZX+uXgIcIRdXUXy/0Fj2MG27wdXrgOHptbjPUZihw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748941869; c=relaxed/simple;
	bh=lANQleI3CvFAr2RrMeWzgj4sCI5X1EqHzIOz8o9N9OA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bP3K8Et82jhbFbaO7jF1LvOHI3fCIDVm5dY2nJt/EWnXRcmi0xk8i1ZJPAWr3Kwt7e1WtWv1AnTGjP7j4tV3qzxQgVAOI0D+Z/ClkTFx8iIgdMiV3WLCcPEqetMC6hkXJgOwHSlSqmaxDSAz9fNdPpBaKzOTgRdPP7dTQ7qI630=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M9SHQhPC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5533oLBx014438;
	Tue, 3 Jun 2025 09:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7kZcndFGS+FvzQjwbPfh1+P14C7tF3TOnMwKKytysyE=; b=M9SHQhPCTVukfCtN
	xTBYWoyXRu5pW/mQMdhmfa6IFQGWQyArrIQi69WTJSiDseezZBeTPvgV2hNJ1Gh0
	JhEtNHzaqWJzKzZvdXXGQ0Mm8RwentTMFFmxGq6+yDNezAcQ0c1fRRYpgnmATY67
	vlRceDGB0dn28/F1ki3BafscoY2i/38JKTAg4CWm/TDWsF6ykHh5Hl1d/G7F/L6v
	c0big2gzkJPBiA863zTldgwBZNp5dVhAUvX/53XquGrYdexOjP5xmfPwdGYAkT9q
	7cTjjKKM0gQdDhKFGc2xXqb8K11D6CALO++tXUXi+BorMrgmgeY2IcHbXxl3QFJB
	ISNntQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfurtdp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 09:11:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5539B4Pp015492
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Jun 2025 09:11:04 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Jun 2025
 02:11:02 -0700
Message-ID: <92d88f2e-00be-43be-ab97-5868eb778932@quicinc.com>
Date: Tue, 3 Jun 2025 17:10:59 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mhi: host: Add standard elf image download
 functionality
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        <jeff.hugo@oss.qualcomm.com>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <can.guo@oss.qualcomm.com>,
        Mayank Rana
	<mayank.rana@oss.qualcomm.com>
References: <20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=683ebc2a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=yUlHghQYX284gOlzSqIA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: SpDUR-NDEUzw4fK3sqXomy396aeexNEV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA3OSBTYWx0ZWRfX0QuCufzdCyVm
 iUIZLDC6SWHKd6Mu4s+KZbcxe/xIVXs/NMisHNngm5LIHRdDPFi/RXgNte+t1h+qHgja36zQOLw
 /iDxXeEouwpd6F5ODY69eDAOLeGOsR338DxOohrjm0K8c+LJiMZ8uV5IuqBM2eYnA4SvL/5BtrR
 fPQ+rIgVHgdVCMUC4PAiw6RWr6qZpsQVgAXEifb+bWoj7N04xcWqM3WnxuvAD/H3WSi1VWxKsZu
 bfs0Aja3rvvFoPEjn2CrtLX3slqHb0N2PnPI9E43IwVsuGjWzZFqXXVKvAebkbx1SohlgCPediQ
 hwT9G7tuva41vXR/oBuxpFgDtZl2iFzYwyUXEaX5X2r8rvlVLD6Our2v10z0UDUvBCxVvDBb8cb
 FVUkdGUgVZ/bqP4mLmR+VBGlLV/yUtP+iW8Y/U+M6/pfwPYKJ3j0F2+07nA4PP8Y2ZkvJOtI
X-Proofpoint-GUID: SpDUR-NDEUzw4fK3sqXomy396aeexNEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030079



On 6/3/2025 5:05 PM, Qiang Yu wrote:
> From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> 
> Currently, the FBC image is a non-standard ELF file that contains a single
> ELF header, followed by segments for SBL, RDDM, and AMSS. Some devices are
> unable to process this non-standard ELF format and therefore require
> special handling during image loading.
> 
> Add standard_elf_image flag to determine whether the device can process
> the non-standard ELF format. If this flag is set, a standard ELF image
> must be loaded, meaning the first 512 KB of the FBC image should be
> skipped when loading the AMSS image over the BHIe interface. Note that
> this flag does not affect the SBL image download process.
> 
> Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
> Changes in v2:
> - V1 patch is paused because of no user. WLAN team plan to add support for
>   new WLAN chip that requires this patch, so send v2.
> - Change author and SOB with new mail address.
> - Reword commit message.
> - Place standard_elf_image flag after wake_set in struct mhi_controller
> - Link to v1: https://lore.kernel.org/mhi/1689907189-21844-1-git-send-email-quic_qianyu@quicinc.com/
> ---
>  drivers/bus/mhi/host/boot.c | 7 +++++++
>  include/linux/mhi.h         | 4 ++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index efa3b6dddf4d2f937535243bd8e8ed32109150a4..f1686a8e0681d49f778838820b44f4c845ddbd1f 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -584,6 +584,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	 * device transitioning into MHI READY state
>  	 */
>  	if (fw_load_type == MHI_FW_LOAD_FBC) {
> +		dev_dbg(dev, "standard_elf_image:%s\n",
> +			(mhi_cntrl->standard_elf_image ? "True" : "False"));
> +		if (mhi_cntrl->standard_elf_image) {
> +			fw_data += mhi_cntrl->sbl_size;
> +			fw_sz -= mhi_cntrl->sbl_size;
> +		}
> +
>  		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
>  		if (ret) {
>  			release_firmware(firmware);
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index dd372b0123a6da5107b807ff8fe940c567eb2030..48f2b50038519111aed2075f01d0704adfc8989e 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -360,6 +360,9 @@ struct mhi_controller_config {
>   * @bounce_buf: Use of bounce buffer
>   * @fbc_download: MHI host needs to do complete image transfer (optional)
>   * @wake_set: Device wakeup set flag
> + * @standard_elf_image: Flag to determine whether the first 512 KB of the FBC
> + *                      image need to be skipped when loading AMSS image over
> + *                      BHIe interface (optional)
>   * @irq_flags: irq flags passed to request_irq (optional)
>   * @mru: the default MRU for the MHI device
>   *
> @@ -445,6 +448,7 @@ struct mhi_controller {
>  	bool bounce_buf;
>  	bool fbc_download;
>  	bool wake_set;
> +	bool standard_elf_image;
>  	unsigned long irq_flags;
>  	u32 mru;
>  };
> 
> ---
> base-commit: 6348f62ef7ecc5855b710a7d4ea682425c38bb80
> change-id: 20250603-standard_elf_image_load_support-da9a2c649411
> 
> Best regards,

Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>


