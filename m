Return-Path: <linux-arm-msm+bounces-84567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0E8CAA506
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 12:25:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FE2F300FA0F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 11:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C338B2F261D;
	Sat,  6 Dec 2025 11:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TorHihRK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ACnIIHJS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CED2E11BC
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765020341; cv=none; b=BUZJZd3hIk2uhShHvoXTniwn25bdOqdsu+pk98/xDYjmceRiZ/4Vu+hQcpdfmB7GY3/1aBGllaannS5ufVWhP3e/sXIBw0keGXPaG/3pR4FSs/Zc91s2mPbRhNmwUwfq+Z0fm2hRcXC2wOksNqzbB48eezUWacmNXegB7EDv97U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765020341; c=relaxed/simple;
	bh=MpzTT94MMxQD65k1QeTEcNTN6kRAMXbGuuqtwqmzas0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdYCljVRs+pLOAAJ5PzWaRQ5NcX5+AYZQ2YynT5ZolQmheajILQzuMpd3OjJlc0Bapn/omwDshUOovHUf/I6OK8vjAMSJyBN440Dh+UjGaMQuJuqLGARbm+zzW4yjELT9xTzi3MBUEfG5jdSfirUNXAAKQ6q9KGTN5E6Av2GpO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TorHihRK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ACnIIHJS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B65Yu1J2778290
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 11:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZJAiSLkmpLVQQ/M2BvdZV3rP
	V0issyyWF6oK3RjccZo=; b=TorHihRKSc2C+INWVm50Z1eA+CQYZp1mM6mSos1G
	EQNtxlmhmIsjSyt9vaWzW+MG642A9pMPSQMZFFwUmaaud8MUA9gqvhHGy8InxtPR
	VL2KL7m1lITa4OpoWvBZ7W6xYz5RcBXukv6UWtDLQerdXiCDX6sBdxD+hV6nm8T9
	s6E+RvuU6BdWshR5k4H3yGXBGgTHzMNvaFSJNF9XjNOqBaNWKwThvGygYzBnSrop
	P3MMMHCnzLNDGtgGRK0mwbWd8VF62kh/jOiXbpPiKVlvStRCtzX3NUCvc5EDsZQm
	gkeOl0/ubksTpjGOXkhzMSO1bH6yLZbBIJXmd4E45SFqgw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcv80kqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 11:25:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2e9b2608dso498447385a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 03:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765020337; x=1765625137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJAiSLkmpLVQQ/M2BvdZV3rPV0issyyWF6oK3RjccZo=;
        b=ACnIIHJSG2XL13u4GwOLWPuIWsR2lMfTdOw4ch8JTSYhlNLH0f1vlj/JUy/7Q7v+8b
         rkN/YAFSsZ1PJNk6BBjC58xpcmdasvpEgfgx3H3h/vZiy0rg/ES3GjW+qa5ed0bmMGUv
         Kaj0fK7HXmcHpXwp3TxuVLnSJRigeB5zTlvQYlrGn5Wbylti1TiohnIcWLyaY1W8bYaP
         JITkZbDTEy+smLjXNIOOyyV+N2OSzU+Px/ewsbpI4WZp43ijLqPWa/EhAVO9xVjgnZ4V
         t2UO12VPOCLnKO4Lo5paCVVi/mxG/jsGHLMsOqa4rJ7m/qIOmmHJq+77VENvDbB/9iSL
         AbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765020337; x=1765625137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJAiSLkmpLVQQ/M2BvdZV3rPV0issyyWF6oK3RjccZo=;
        b=AOKbLy8u2lwBHgITq8HJlWMymBqgwHT/lcd8MMGqTcKOO6iT2/8nQuclHZt0Oe+VMY
         rkKsNpAlcufQ+qdlux+/jUZYyzle8nbb6JRvjlMVmlHv+E+jeAlc41nx7Emls76hXnsG
         nydkte8DAu89T+/mGh5Ar9eubdYM+zTmGWcSkdP28kpNY9L1j9vMj0JV7p3BhO9Ap9v1
         RT8PPT8nNYf6IjHaWdxenwkFe9mUf8y4Drtzlq7+cDhxidEqtrUuJ0t9Ap1BbspSVoIB
         3PrsoUyGmsVraKYaH7jyjqCglUz2ufrayyeoPKHCyio+7GL0Q6a2uelstxTzOJg8VInu
         hnnA==
X-Forwarded-Encrypted: i=1; AJvYcCVH0KNS1XjFvSOkoakVbM032OyhPtkWMzvnoBppTY3OW6wh29efJIQ0528w836WYkE9HW9L2xu3J6SWYvsG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4nf8cJF7A0eYlk2Hauj1VXW6jtKfjgP+CVDwYrnHRtnRkeecD
	zWhuwrwZhhZa+XJ+YpHFJ9kyatLDlLLHEOqJVlg25hDaVEASPcJ3iQ6SVd/d7iApQYRuPVDAHi3
	hEU2nSplD1Y6ZRVSFTRfV6HQcqltWqDU3pzuFEvoU/SzVQ4eVjqUG8G6N+6+fJShGY0a0
X-Gm-Gg: ASbGncv2PqmT7LveMObjXTbZNg7wt3pDWZa1oVFpGXdPgOjhcvOh2E2v1jKbhjHcSbC
	iu+RP0ZRZh245D01EL/hCnzgN66+YAuZ0D2UT590p+Esygb9kXnOIFtM8O2URL5lEtL2UjZ9JoQ
	6eKv4LBsCetFUu1L98HOVg3azyWNHVA1RaBFOyo730ROMWr9x49EfSupnxrLhupiwtyxbSTnCt9
	ZDv0sDfG5VKIhaXp/XduijTJN40X26vHDr1iEYgy0XnQn0P7Icd/W87Rhu30X1mxw8SMo+PNvm9
	1cM9xxjpWxgg+IdJ+t/88jY45/JPq4M6kBqkKSNeOG14Rz0tHDE52rcX9nqn6WjaxBjULUzpcdW
	++u8ZPuvoaxB8W9oUDV4afD2iSaQxHY330xoSvei9crNFrFtGlu8NyHSoyoEjeJkI0r3OjU6r9t
	fkdb/DPzDvAfqAOXaQ2LFVG0M=
X-Received: by 2002:a05:620a:4045:b0:85c:bb2:ad8c with SMTP id af79cd13be357-8b6a2581abbmr295846485a.74.1765020337535;
        Sat, 06 Dec 2025 03:25:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEp4q2zNCY+Q+hU8LpGlOF7IeYTueJ9iFt1j77XRfNLwcyGaHs8TZbT59QFGlsoKU4t/ubTdA==
X-Received: by 2002:a05:620a:4045:b0:85c:bb2:ad8c with SMTP id af79cd13be357-8b6a2581abbmr295843285a.74.1765020337085;
        Sat, 06 Dec 2025 03:25:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c27f44sm2319747e87.73.2025.12.06.03.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 03:25:36 -0800 (PST)
Date: Sat, 6 Dec 2025 13:25:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <ttpn6o2far7xebghblurxvi43aohv74v7jq2vdgc4jhgc7avo2@lgp4y4sytene>
References: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: nVH7paa5CEGoQ48-qxwOPqmcd4P8Y4Yi
X-Authority-Analysis: v=2.4 cv=KL9XzVFo c=1 sm=1 tr=0 ts=693412b2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=RFctcJmZgZ_UK8lNnkcA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDA5MiBTYWx0ZWRfXxLe1iI2sIdN/
 WEQiWo9CneoMc+u1zRkpceBF0CVtxjxQ0S/fye73P8MCmDoIYK3DP5UX50nYqB2eYubN6L2ZW3v
 YtPUoEWCj3hOaWzKrZeoZZQEnNa0USwnJK6vHdfXijuJy0bfGh9uwG1Q99mKS7hDctMs6yZwucD
 QYR4rwcY8krsGGHCDfmfYVTRD67vv1QaLZ6a9WymnIL2/aWam3YS0ZbQme2cqJBA0wIkeW5BDJ0
 wdJgS5TXfJpdd4JxMtyGvl73TVSau6/KXXikKTibP8xOhTxvyYLnBQ34Po29O1vLL2PYcBXjKHb
 MYBnw0t4AGOp0pcwTfrvC7kt6Ig8rO+9i7CYdSjnm2E7kWnNVS3x3xBiFwKW6enI4MG2tOzhvan
 axdRvM6cepHHEOYAgXN4/zoCbK2AxA==
X-Proofpoint-GUID: nVH7paa5CEGoQ48-qxwOPqmcd4P8Y4Yi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060092

On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> 
> Currently, the FBC image is a non-standard ELF file that contains a single
> ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> separate ELF headers for SBL and WLAN FW segments due to TME-L image
> authentication requirement.
> 
> Current image format contains two sections in a single binary:
> - First 512KB: ELF header + SBL segments
> - Remaining: WLAN FW segments
> 
> The TME-L supported image format contains two sections with two elf
> headers in a single binary:
> - First 512KB: First ELF header + SBL segments
> - Remaining: Second ELF header + WLAN FW segments
> 
> Download behavior:
> - Legacy: 1. First 512KB via BHI (ELF header + SBL)
>           2. Full image via BHIe
> 
> - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
>          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> 
> Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> supported image format. When set, MHI skips the first 512KB during WLAN FW
> download over BHIe as it is loaded in BHI phase.

What is standard about it?

> 
> Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
> Changes in v3:
> - Reword commit message.
> - Reword comments of standard_elf_image flag
> - Add reviewed-by tag.
> - Link to v2: https://lore.kernel.org/mhi/20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com/
> 
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
> index 205d83ac069f15a19ab2d66a63692e5d60334d4c..64fb7a257d3529167eddf1153d34cc6b25735809 100644
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
> index dd372b0123a6da5107b807ff8fe940c567eb2030..a13106bb234d22e3876dff3c0d46f3dee1d9e05c 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -360,6 +360,9 @@ struct mhi_controller_config {
>   * @bounce_buf: Use of bounce buffer
>   * @fbc_download: MHI host needs to do complete image transfer (optional)
>   * @wake_set: Device wakeup set flag
> + * @standard_elf_image: Flag to determine whether the first 512 KB of the FBC
> + *                      image need to be skipped when loading WLAN FW over
> + *                      BHIe interface (optional)

How does the description correlate to the name of the flag?

>   * @irq_flags: irq flags passed to request_irq (optional)
>   * @mru: the default MRU for the MHI device
>   *
> @@ -445,6 +448,7 @@ struct mhi_controller {
>  	bool bounce_buf;
>  	bool fbc_download;
>  	bool wake_set;
> +	bool standard_elf_image;

This flag is never set, making it a dead API. If there are other patches
setting up the flag, please include them into them in the same series.

>  	unsigned long irq_flags;
>  	u32 mru;
>  };
> 
> ---
> base-commit: ac35e04f8000aaaf98635792464647e7a6f3422e
> change-id: 20251129-wlan_image_load_skip_512k-ddcfe49db8e3
> 
> Best regards,
> -- 
> Qiang Yu <qiang.yu@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

