Return-Path: <linux-arm-msm+bounces-89637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE83D3A746
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ECACE300C9BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59AFF318120;
	Mon, 19 Jan 2026 11:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mS9A1G33";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iCQpLgiy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AE127FD62
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768823226; cv=none; b=hiTeilftnr64tgAIw1bvU0LMDcLVXJEwQBa4X/f5at3eUdcX45Jx3h/ULdtDHhoPR2kSDF5mdufwaTMzSqkqSwENbdEZFQaadTUlcNEmgJfBfTJ6FACYAWShCSFpGIaJARH8iiME++26dp6ZqHHCZH/K15jBDPJMs8ZPim6Cp5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768823226; c=relaxed/simple;
	bh=WphD3di6sPvBYWLWfOlZFQEfvM5D5MOizS2is20CSA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iiElddAjra7YmsEevm447rzjdmb22kxVRA3LTjsUZfxgKV1Q1Qi1whwSpR5QnQ3Fg6Mj3cLUABn5Ju4VhmKdIx1oeqprfUB3DOAUygzLQ4AStehIQT837T3p5bMX/2FrNrPxeT8xi+fYH40492ELEdPCA8yJxypm6oYY4DW4MwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mS9A1G33; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iCQpLgiy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90jCk227869
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M/kXB9qV/mARKq84Xs1cOBzOK1huJAJfToX9eRl6AHs=; b=mS9A1G339ZJwcryC
	OxlCD1EbNjsXWuZbe33d6R3UEBmqU86gn2skhLjd++cDhn3dshpBcs39QAKbVPhr
	HrB7Up7sr21iyyC9uOOHJb5UcjAPl5a+h5EdlvY5tZCZLl99k35Ar3KeoG0/7Mdk
	47L+YzPTIBCpfJD2ExVdZdvm3FLrZ6vgGw2dF0Btd74K2liYyN1Y1XTQkNxAeWq1
	4jqzTJ65f16ahgowtWb8sYzSwzJ30S12adW5Xp0Kimy2I/GrMNGemADq/OuDONPY
	90proo8DJYg/41vBS79I1hQge6b6KddbzyFBT7Vy1P35NXLC+1zUGye6z/92nnqb
	PO6HFg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfr8t5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:47:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c64cd48a8so4445316a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 03:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768823222; x=1769428022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M/kXB9qV/mARKq84Xs1cOBzOK1huJAJfToX9eRl6AHs=;
        b=iCQpLgiye4N4IAZofYZ8fCgmY7iHUie25NRUz4/DSe2qUxnUbZfFmMKMd1+xNnNQuK
         sTFBzF/ToAsyx/SGCP8dCRoAZtMeGHhk3qu8L/qeJLsKsxR+gVfxOXy4rpUp+N4AyzUi
         uzlx6AHtIYWRYeD/UTHhWd8yjUbju5UbJeicYvg/FTZiK+ZZxR7bQTqLz237GKUNqfBr
         Wi40708YDReW9repnHr8+IBwe3RAEBfrl1fIFrNSI432s1G2eHmWqtAvXSf/r688XGCu
         wXQp30P61wmMLztP5h6Lsj/PNzp85CxdWCwwS/Vo0SwUyJQhq1U7Zw9lVyLjzLLC+S8S
         uoMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768823222; x=1769428022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/kXB9qV/mARKq84Xs1cOBzOK1huJAJfToX9eRl6AHs=;
        b=vkOGBCxZUqAgnVXBvnL3EkrUX3cOnQFST5e0pXT+qmVQd3hJBSi1GnZVR1UxAkBHNW
         aj2FL2sTAVRlWgzYPR8XUJnTMsdzHYPKz22EYSeC2WzBjWsMpNQ9blmQ3CdfRpQq+5sE
         2IeaEbE2Wtyqq6HI2CR/JoTQkU+V11lZwRVgCxlSVWxG1r+XUydVJbWoEjkl+//UpYMR
         3kmMncgn6aQl/Wj/TFwUFKC1DR/MOqsY0NoQfLuu1ReLKPYbB44If7JP1v6fJjxZOGeA
         fsBI/vKDRqNPOAiJMkhrwitQ8uxnTDxWaqqyjR8+nBPPJqS+Mzrun0SHnWJjY9SIrg6I
         bHkg==
X-Forwarded-Encrypted: i=1; AJvYcCVKRGprq3YdVVk7BiLWkQ/5gLrNknRDHXpRFx5CWz/AoM3NOdt+YGNA+YE6tXfDYnWgNqQk/Ag/ayOlozC9@vger.kernel.org
X-Gm-Message-State: AOJu0YxxVo9F59Ki5GKG5xUftopJmPXk1jV5uaVr68pV7BQhxInDo/nP
	IYEin9yK+EUwg96xa7uxx4ohaAnLaktDgJ7sKCSpCzMjt+sPL22Brbmek66pu3f8Iq9oVxFFhno
	XqsfybK5j779NA/n93uslZ3f7NtcFjIFcEE+BoknlOVv1YExHXeehYJMlm4R3g0WhGoPY
X-Gm-Gg: AZuq6aLVldnAit5E/Sec0KRUCr31YeKyTOd2MngJYBTZIYhK5xM9o7b8DRuf5/E5f4v
	GJNuZ4hDa+5Zv+BYEOrzcgQ/xxaiJ+V5TZuBeb+JYzLg6rFMYla1QnEA0DmZHMr4XWesM3o/2t9
	czkUZLmd9m3p48uoqpvBT9jSKRpXuAZLcEpWK3l9eQPrM6RSRjnPRf8nCPuJ+oXICMYE8JdsUZa
	YKkHTZv9vSoSl6WnL4jLHxK90GGRutcY6hIMgJgRD9tvM6gKJTeO8qmn1jS9dG3BpKKEMryVFZk
	Y6T0FKz0ZMJ+y+WUCur+9h/5ebVN4wPuRAaAJ3/W0qPW7N4Yc6VBymIPMAfFI9pnO+makETCeK9
	CwK5YIVJCGF0PPVMdVxHnJjGU3bCM82oODQ4=
X-Received: by 2002:a17:90b:2d47:b0:34a:4a8d:2e2e with SMTP id 98e67ed59e1d1-35272f973b4mr9869543a91.17.1768823222181;
        Mon, 19 Jan 2026 03:47:02 -0800 (PST)
X-Received: by 2002:a17:90b:2d47:b0:34a:4a8d:2e2e with SMTP id 98e67ed59e1d1-35272f973b4mr9869524a91.17.1768823221716;
        Mon, 19 Jan 2026 03:47:01 -0800 (PST)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf233914sm9089925a12.1.2026.01.19.03.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 03:47:01 -0800 (PST)
Message-ID: <a963b9cf-006c-4fd3-a1d4-789ff10ed10b@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 19:46:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Bluetooth: hci_sync: Fix not clearing
 cmd_sync_work_list on power off
To: Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com
References: <20251209140347.2816326-1-shuai.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <20251209140347.2816326-1-shuai.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KD5a7ceTPVDALiWcPqD04CjDPwf_JdAF
X-Proofpoint-GUID: KD5a7ceTPVDALiWcPqD04CjDPwf_JdAF
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696e19b7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bkFCjwZo7dHlCUbkh74A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5NyBTYWx0ZWRfX+Zwo2ikyZFn7
 0ZORQX9Kgwo0k1jGmxqX1zE1N/tQFZwtGhNFj0U6Lz6YpvP9LibtzR76O2IVHSFESqYAS0TpTSZ
 2mFdHQQc6qc3GURa7eaYg1iZWNAXIOzOtJOggtQSX9KrK4joa0py7TzgJ9YsDEU+7gEMjpNBmMG
 cDkWZy8WGpEcjg+ho9cpGZmHi24t+c7qWmbQUKl9wz5s/4z/5ebRhSTAR5X8mTQz/kup3tJp5Ct
 0m8IUaV5aEOl51xiMYGIrL6+OERZ86aNolwBrOkvalLoMtY+O0YhMoBmnBpWpIwpMgQ94sBQIL7
 XvCqHtcwIAs9IgiZJKfTx7a+lRdX7aopPZktcPc2Ed48UHnY8CX764yYsDGGkvUnTCP55GAYJ3D
 YCQfVBTAOdCbG3hoMFxowZMmZ+LywXeK9WsEyYOpUSOVT6id+ZIacEPjpi/x3/hpD1jPSfLSV25
 OpzX7PzZar5rbTkbGLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190097

Hi

On 12/9/2025 10:03 PM, Shuai Zhang wrote:
> When powering off the cmd_sync_work_list may contain items which shall
> be cleared during power off as they shouldn't be run during power off
> sequence.
>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>   net/bluetooth/hci_sync.c | 20 +++++++++++++++-----
>   1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> index a9f5b1a68..45b593ec7 100644
> --- a/net/bluetooth/hci_sync.c
> +++ b/net/bluetooth/hci_sync.c
> @@ -648,16 +648,22 @@ static void _hci_cmd_sync_cancel_entry(struct hci_dev *hdev,
>   	kfree(entry);
>   }
>   
> -void hci_cmd_sync_clear(struct hci_dev *hdev)
> +/* Clear remaining entries in cmd_sync_work_list */
> +static void hci_cmd_sync_list_clear(struct hci_dev *hdev)
>   {
>   	struct hci_cmd_sync_work_entry *entry, *tmp;
>   
> +	list_for_each_entry_safe(entry, tmp, &hdev->cmd_sync_work_list, list)
> +		_hci_cmd_sync_cancel_entry(hdev, entry, -ECANCELED);
> +}
> +
> +void hci_cmd_sync_clear(struct hci_dev *hdev)
> +{
>   	cancel_work_sync(&hdev->cmd_sync_work);
>   	cancel_work_sync(&hdev->reenable_adv_work);
>   
>   	mutex_lock(&hdev->cmd_sync_work_lock);
> -	list_for_each_entry_safe(entry, tmp, &hdev->cmd_sync_work_list, list)
> -		_hci_cmd_sync_cancel_entry(hdev, entry, -ECANCELED);
> +	hci_cmd_sync_list_clear(hdev);
>   	mutex_unlock(&hdev->cmd_sync_work_lock);
>   }
>   
> @@ -678,6 +684,7 @@ EXPORT_SYMBOL(hci_cmd_sync_cancel);
>    *
>    * - Set result and mark status to HCI_REQ_CANCELED
>    * - Wakeup command sync thread
> + * - Clear cmd_sync_work_list if the interface is down
>    */
>   void hci_cmd_sync_cancel_sync(struct hci_dev *hdev, int err)
>   {
> @@ -692,6 +699,9 @@ void hci_cmd_sync_cancel_sync(struct hci_dev *hdev, int err)
>   
>   		wake_up_interruptible(&hdev->req_wait_q);
>   	}
> +
> +	if (err == EHOSTDOWN || err == -EHOSTDOWN)
> +		hci_cmd_sync_list_clear(hdev);
>   }
>   EXPORT_SYMBOL(hci_cmd_sync_cancel_sync);
>   
> @@ -5260,14 +5270,14 @@ int hci_dev_close_sync(struct hci_dev *hdev)
>   		disable_delayed_work(&hdev->power_off);
>   		disable_delayed_work(&hdev->ncmd_timer);
>   		disable_delayed_work(&hdev->le_scan_disable);
> +		hci_cmd_sync_cancel_sync(hdev, ENODEV);
>   	} else {
>   		cancel_delayed_work(&hdev->power_off);
>   		cancel_delayed_work(&hdev->ncmd_timer);
>   		cancel_delayed_work(&hdev->le_scan_disable);
> +		hci_cmd_sync_cancel_sync(hdev, EHOSTDOWN);
>   	}
>   
> -	hci_cmd_sync_cancel_sync(hdev, ENODEV);
> -
>   	cancel_interleave_scan(hdev);
>   
>   	if (hdev->adv_instance_timeout) {
Kindly let me know if there are any updates.


Kindly, regard

Shuai




