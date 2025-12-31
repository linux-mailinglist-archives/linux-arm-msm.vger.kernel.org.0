Return-Path: <linux-arm-msm+bounces-87139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4F8CEC5EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 18:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 296C5300B83B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 17:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F24E2BCF7F;
	Wed, 31 Dec 2025 17:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AKl5A0tC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h0CGeqvd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A85129E0F7
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 17:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767201813; cv=none; b=aJAkh51v8DLw/4f9lIyKsJzq9tVIXjmxE66zBHiDt7YD1StGCegqCpIMJ7cy8hn22jh5FiMpXTwWz4kc6r1pKAHuIj2ajyuLcprE0EZSL4+TfGZkb6glPtvN4gQ+Zdy8sS4fRuP8i+/W/2Wsn4IUlwaVwplLR5p3HIRmyKGDTLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767201813; c=relaxed/simple;
	bh=L1dc92einE9XUo2czagksPV5EG/oQLQnQ/ZhdF/MkOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u38JVJDQpwxTuvAocaYyCRNpt1yWFTedu1eWmnOV+w3KlTiDVWtdiuTOWVPjxN3LENUCrNYtEnNeCba1TXuW9oP9eVhRxQfi6y5hjSYydZ3ZkyvKtrIf73T9jVTLwCs9Z7Si3G/68RaNgFfF+PADi/KINYn5DQBV34A1hDu1jGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AKl5A0tC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h0CGeqvd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV5wArr901151
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 17:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RqyAdcZxMRhdoDnUEFGoqY4C
	1m6Fk1zKRYQmRrMBsgw=; b=AKl5A0tCkCngw4hqZBCbc2QbqtT2QYHFEC8ND+w+
	LfFDiNB0aeU6bQY8y6rqdrNgLQYWT+q87uZCM8ug6xfP62ZTcgMUKfBD2CU2XZHS
	q/Rph5q7LRJPnlGRXgtGGrH3qUc4mSeNZoY6TiwOQDb6O3HPC3/OoBOyHzlQ6UWV
	TfWVLmcUmVxSCFA8vW746h3Q4LxhUIpUr2PXL0do7QT3Bzx9UaQpYuYXR2GaNCSu
	P56tkJCHYkhmR+2/yeeJGmL4eUstcj4XzmsnDfofV/4GPcTJn+P4UNIBoac7zghJ
	UFzA8Tew2T+Z1hqGePu9FJYLl1IPNaii8ljxYbB/fbchcQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky3xhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 17:23:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee09693109so221376081cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 09:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767201810; x=1767806610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RqyAdcZxMRhdoDnUEFGoqY4C1m6Fk1zKRYQmRrMBsgw=;
        b=h0CGeqvdicEo3oPxFfrnVXMPUU+BVshg0xswTWI5YJaSpxI3d3Z/izw+qJ9VxwuD5O
         7VqCzYjTS9IrUUzRC/tXX3Zb6lJXpMPO/f2UVgWt7fx5IxdNc8DN78FUFgJFBdguQcYB
         iXp1JqP8pNYxaPCgejMicl11bEyKk1owPCPYEXQaEuqvpu0Hv+GHZjgJxTDhQpYHsSDb
         r3CtQAkAtNJQfODDdUWTZjVhQ80PrgUnkHNgoP8r0IxmZENid2MOgU3zjM68nMNg5Wet
         qTxxKUALRuXXnCR94+Of+nEK8/faLF18QCBG6y5VunCKl3KSFkdrstaM9fd/QYoyj5ON
         EQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767201810; x=1767806610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqyAdcZxMRhdoDnUEFGoqY4C1m6Fk1zKRYQmRrMBsgw=;
        b=AMm24KQ8gxF95TRBa4eYdIvWbaCMww1eG00cPhVKIr55M3mQcxkmpJTISPE89AaEQZ
         5FadPPKnbUxPtaExLXIXx8Dstsoe+2H9OLr0belaWvlviDJbBUGJqjetE9Sdgxq7DEna
         x5HBkn6RZAj3lJLkgD2je5AJEbMOcTDMz3EKRsrfyT/LN89vUibmsSbbJmms/by4sE6W
         skALC2MCOHjE08TVr7DcuDj7DhomUE2gX9OW1h9swC3EB0qOfwhvXylVoccz/DCmbws7
         ZceZNSSjvUdd6rY1aiuobasswgaXDGDRwOCLcj+QAzJviYbX8dRqKONtZaCqac6kJU31
         FKKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV21gdTCP6E0HKqjnv8Qx1swzuVm1Hn/U8aeP8fCoE87gEVz9ZMBKyrjyHCca2EfYq7kOTZ7S8V63Rb6IqZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzJLVi23w2R7F3ZfhExhv3EfeLunr/uG5P3Vv2ZDmSTBGjtF75y
	3cXvd47LENP7YRuSxKYBTLfURF4MlLlo8atsyWv9n1o59effzoPITFhZQTX42Ixa56HXjpSpfTY
	c9tYwWNct4DnN5uoaR8s7QM50tPJmr6JTBxVP8UyBQLlMnEGYP8wpEmFAmNO0Cw6XTmk2
X-Gm-Gg: AY/fxX6H5rm17CvSOFxwZLNZ58n2wduxnRSCfddd7Y3M4CpcK3joF/RH5d0nsNt9JqB
	EYFjTEVGvH7ZsXPdUCe+xxWrn+flgveG+3oXMbDe96aqDEi1YjPE+8QjqJweU8izDgorsijIw7z
	TrCR281v9Rk1dcmO7Y/wNy3ZKeR8dIaedPmRB8ueoKoGO0VLs8dm6fnhYNXPR4A4uLWDKbNJMEs
	8Lb9kmCNzMPxfc6fyqKLbdH0/9n7HvlkCcfne5Rrs6C1bzV1j+zUtPRDdF8wtS7U9IyjRrBc+ug
	7l6+PAVQRupZxP3sTxpsZO29EfW/wKZxQ3+Xv4/EspXphfIBaqCS//BAw9uxGENI1kkdQ4vFqZT
	W2q8xzoaPHPrTwgU2sVXpuv/EQi4DRy63uEUL4iCIrc6H2a1zUw2wn/PZV9GhxmVVnTteGZgr8s
	jZy3A4Wf8di7BLqqsJsDMohhw=
X-Received: by 2002:a05:622a:a11:b0:4ee:219e:e74 with SMTP id d75a77b69052e-4f4abde4c12mr575557071cf.77.1767201809662;
        Wed, 31 Dec 2025 09:23:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNiuv35Naad2vjeZ0xw6PScV7Af9vnkaKsc5ltn48Bz1y26EAB6wcfXdR408bMToyGoHqnPA==
X-Received: by 2002:a05:622a:a11:b0:4ee:219e:e74 with SMTP id d75a77b69052e-4f4abde4c12mr575556691cf.77.1767201809253;
        Wed, 31 Dec 2025 09:23:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618d6fsm11100815e87.65.2025.12.31.09.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 09:23:28 -0800 (PST)
Date: Wed, 31 Dec 2025 19:23:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH v5 2/2] Bluetooth: btqca: Add WCN6855 firmware priority
 selection feature
Message-ID: <wxfba3ldef52mwuhthyh76qd3ppmmhmhuzhck3yziju2iil2vy@6elo3tzkjdvq>
References: <20251231075817.2611848-1-shuai.zhang@oss.qualcomm.com>
 <20251231075817.2611848-3-shuai.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231075817.2611848-3-shuai.zhang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDE1MiBTYWx0ZWRfX7QEz9qMil2qP
 XIwBL3D6LvOxvlxnWIMYDQsaisodUGX4462p3bIkdb79l2p2ppejOcNwL+EVTMKLi0Ue5IA+ckp
 9QV4JjIJpUGt11nSbkfvTf1rPUdYDlHuHIwVoKKFF6H8oxjDLjRLGgOhiJUrNa2w1K65VitotON
 rsuF7M94INPBnIOVtUWIeRRKXFrMt1fFUb/Oxg5AkMwdIUzQzvxUQMDiAmsm4+Ja5PzvdUsIA8x
 i66coKhiEI7ITb5a0graREex45AQ0OtnrNw7UJNVKpn4Zzi0fF1vIVIWi0VAyGyQBAMZ8FZxd+T
 Um7xhbRi6od4vSkpixBFRubJlhy/FCLk5cccLxDIvNImwUuEptn1p51LtAEJMiYBe2GzAwsqV97
 LEi/HB3Q7P0RTEH4nkoi0p4yyVl3gozmH4BsDPKbpsX9cfhwgZRCCYjwkG9oLu7ctYz8YIcJBfq
 Hja3e3lQeCk72kKQrIQ==
X-Proofpoint-ORIG-GUID: faE7mWhQyEjq-ceMl-Q6o6sse7ZW8Cz-
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=69555c12 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=fHN9rbdO2-7uurTg0k4A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: faE7mWhQyEjq-ceMl-Q6o6sse7ZW8Cz-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_05,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310152

On Wed, Dec 31, 2025 at 03:58:17PM +0800, Shuai Zhang wrote:
> Historically, WCN685x and QCA2066 shared the same firmware files.
> Now, changes are planned for the firmware that will make it incompatible
> with QCA2066, so a new firmware name is required for WCN685x.
> 
> Test Steps:
>  - Boot device
>  - Check the BTFW loading status via dmesg
> 
> Sanity pass and Test Log:
> QCA Downloading qca/wcnhpbftfw21.tlv
> Direct firmware load for qca/wcnhpbftfw21.tlv failed with error -2
> QCA Downloading qca/hpbftfw21.tlv
> 
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btqca.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
> @@ -936,8 +944,17 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  
>  	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>  	if (err < 0) {
> -		bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
> -		return err;
> +		if (!firmware_name && soc_type == QCA_WCN6855) {

Same comment as for the first patch: move this one level up,
incorporating err < 0 check.

> +			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
> +						  "hpnv", soc_type, ver, rom_ver, boardid);
> +			err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> +		}
> +
> +		if (err) {
> +			bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
> +				   config.fwname, err);
> +			return err;
> +		}
>  	}
>  
>  	switch (soc_type) {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

