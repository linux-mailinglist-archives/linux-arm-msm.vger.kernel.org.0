Return-Path: <linux-arm-msm+bounces-102561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJeOBcsY2GkfXggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 23:23:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F293CFE55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 23:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CF056300C015
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 21:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8CA3793DA;
	Thu,  9 Apr 2026 21:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtPv8XsW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZdklVGlX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BE2324B2D
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 21:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775769798; cv=none; b=gpba6uj/OI8tfZy1hTTLVwbC3pJR0XOswbS/wc1yQiwyMifVTLaOvU40N+NaNQvmMoqH5j8+GhdLsxf44cM7XUSNE/kC74y6EP413qstURTM1Q6gt+nNF6q6l2l8TAWVeHM0Jud1IrGWTo6dLiyh9+lLZxq/G5Gy41scDXyF+v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775769798; c=relaxed/simple;
	bh=LPc3QBu+kJtrwBij2bSyr2bn3fppSoov+nAOiScxvNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WQByw1XG1hiMwumG7UN9Dky/sg58cFPcrI1AsBVTfm4gywN0hToJ/fopH6+12Qtd8GQgGn/V3ztYe+viT0ZrjY6yw1RbmD86v+wM4w4PlbNicLdrc+ULAamUn8gr7oQIU5sv/hY3M0f82k7lhcIPDi2Frwp/J+3/80NNgD1iEbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtPv8XsW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZdklVGlX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639I2q9G3352591
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 21:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WSBXIIWfdwTwS8iiRQJHGI9PtTjv4IHRrGHbuBKd26c=; b=YtPv8XsWvAXUmXXL
	MzZUJC1E2rUDkiHda/ejZd/xqhij9t4SVRA/RZFldHUmjuRbcADFOZU3EYVSM3Ea
	YNpEso/Vx5MS8dZs9BvnmJFFS2Hbdb+tYhOdfsoep0HemYTzrS+R95Q4mX4o0O1W
	UxAVzZQFnELbMJK+VH6dBdqr9KgAb+2fl1E9IbJdSRniDBcskieWxwu6k9SorjeX
	gH1ZSyNCl+BCruBku+xwCTf+KrlSzKArZSzl5C/uK0bzXTeiU91J+Eea4M+3IeLy
	D31iKLibqQU6oyIQR+k3489iyfeeD8hJ+7U/uDLbwFZsRpFE3WmDOHQhusikn1/l
	doN+ng==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec1qsxwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 21:23:15 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c20d5d7f4so257696c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 14:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775769795; x=1776374595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WSBXIIWfdwTwS8iiRQJHGI9PtTjv4IHRrGHbuBKd26c=;
        b=ZdklVGlXFRS/CZdUepaU6Lq2rXMEXkHE94zGCmk8frGBtW8DW2TR7RaH3s0VcImuCe
         bxAEZm2pmSl1Qx4JbqKrSLCkB4GL/xD1oP2qGrPYrLrP7v5pYWjfufYhl3OYkd2wv2Yt
         8D6AyICKl/yCJr8ffsML9Hisd+GXskh/ufJyRD0otm3hYreV6Ng/3xkXoRWASifvE/2p
         8HJVSFKAxSHeoC30BVWHrz7bogbW56EutRBkM+k7iGK4tO6kxGZWuasTvIG6KJVV1dKc
         v5IDTcvIXGOxPjlYNiV84U4VbhC2IcWel+/WO9ARjuPc/GxMoe+n6rCA9f0edQa71ZCE
         54tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775769795; x=1776374595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WSBXIIWfdwTwS8iiRQJHGI9PtTjv4IHRrGHbuBKd26c=;
        b=ayl1G+kKtTK2ZZPaD4jWt+5+q/LsvUz3llSQKxHwmv5lmgyx+yfUo2fVEayKynlCB4
         Lr0UxzmpjKr1vPN9RrCYzZO8u9dnCmvJhjzzzjxqiTu7uMG+4gT+DfT0e0hM1q3rLIA4
         /7BQcSxgmw8rmOUr8iEMG+66gO43NBtqFuI6L7PpI4heu5SZEEZo1WQST9YeBd4gQ4RN
         kqVzKSVMSC49SRXSgn9BK1KyHLEukaQWGKV+DbqmCJqDbBBF1J+bm/VSyDfVjg72TMaz
         FHk4v6e2Athq7+KJtb1Ou9OhvGnLiDj6AaFtCEMEcbufTWaL5kq8j6JWEdjNoqm/oY6S
         8I/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5fRfFME/xXwgwTKAhfGEPU1PnizbHqfCWhwofgt2ayLYLwBnJ12UH2D2aH1oEMVeak5WVp7i0SX7KKMgo@vger.kernel.org
X-Gm-Message-State: AOJu0YzlAo3qyToX7uWaFDuaDPiA7BIIrh/bcdTjCDmrKByGzwmUyf2o
	HkoGSFE7oJriE52UQHD4Ge4th4JDyA5VvnzOR/ZL9iBVFbAa0CZpvE7dugwlhAXZd4tAFksRGg+
	QcfMrvcA/A2X0AVqJmUStAd8wFdnkliRaUapUMdXmksZNgDpLQviYTgKb16BbdMmEMb53
X-Gm-Gg: AeBDietltpacFt5dPiNsLqI/ssRHBlxADZPgcX1+YxoL0sSDzy8OHkMLheCtmjAsyUT
	g2a+txrkr/OVZtuNZxTmFigd+5U7VORDqKQOPyAwZy/3M1RC3ZpZSCMnfuc0o9WUjBxK+JCYt2i
	+Vi3nP76wYbQRvogDS6tTgex8plL3GNh8pmq7ND1DJP65BWb26rM6mE+fwrzXI9a2XypEJF5dKS
	IlFSW3B/6dg64ELXCpxYJlj9SPs/11SkMQH/hhX5r+1APs6iqpXjv2TBRvNuhXo6DPSKSLnoIy9
	l19A9DgfA1Nmhawa7I5GXAF6R0mUaebguftaLhHQrzHnf4jJLXziMFK+3GFNiWGxLS/WObRHL4Z
	lgaz0Uk/jQAM1OIGUejD//PSfhs6hPWJ307BTKeUdYJxTiWwCqqOg086qBMIMDoSDnSACSG19L2
	o=
X-Received: by 2002:a05:7022:60aa:b0:123:34e8:aec2 with SMTP id a92af1059eb24-12c34e4531dmr485659c88.1.1775769794914;
        Thu, 09 Apr 2026 14:23:14 -0700 (PDT)
X-Received: by 2002:a05:7022:60aa:b0:123:34e8:aec2 with SMTP id a92af1059eb24-12c34e4531dmr485631c88.1.1775769794383;
        Thu, 09 Apr 2026 14:23:14 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346fb26dsm907975c88.14.2026.04.09.14.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 14:23:14 -0700 (PDT)
Message-ID: <2865b4a9-9044-4593-b32d-39b581298edd@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 15:23:12 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] bus: mhi: Load DDR training data using per-device
 serial number
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-6-47ad79308762@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-6-47ad79308762@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5NyBTYWx0ZWRfXzdYx7coD4PAC
 hORtC/VgT7GwYdz8XALb84Usk1k3X2HUpUxytRsjyOlV5OAzwjs4ja1cmHUwYUgNCPq1IWy3eN0
 rBYS3ZZmSWJ3TnyjYmQxo/sE8rxXPxZn4YBkjs8E70yj7wOy6lFxLuoS2itqZzG07Y2ZLIxQHX6
 2dCs3zhd3s5jHZ7IU7qaFhbhDafw6lmz0qDqhW5DF34olHNPQ+NUiZFej8OEr7FPg9id+Fe6zv3
 zAuIACgw8gHNConzXyQrchoP/WPSanyBhN7QOnU+r/bqqHOX41+UF47v2CRTkrpVFqCET1KmJng
 LSXLcNCKYp+RZmiUafx7oypvWNuC1K3sGwknluWYKBHzcykqCu5DHafIuw5CNg3Y6Oi3MIUzjAb
 LsnlgHDR83475mZOq9611gNSFq1TU1YMhjkg7R6W16fLQhL3tilA9W8scHSUB98LQ1iCQSUTdPW
 ZBB1LF9BuplSMGah6Vg==
X-Authority-Analysis: v=2.4 cv=eOcjSnp1 c=1 sm=1 tr=0 ts=69d818c3 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4fJIAEbhtct7chBbnB8A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: 7nrFtqm-zHee0N8FhoPBkZqj-FB9sJGR
X-Proofpoint-ORIG-GUID: 7nrFtqm-zHee0N8FhoPBkZqj-FB9sJGR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090197
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-102561-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 98F293CFE55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/2026 12:31 AM, Kishore Batta wrote:
> Devices may provide device-specific DDR training data that can be reused
> across boot to avoid retraining and reduce boot time. The Sahara driver
> currently always falls back to the default DDR training image, even when
> per-device training data is available.
> 
> Extend the firmware loading logic to first attempt loading a per-device
> DDR training image using the device serial number. If the serial-specific
> image is not present, fallback to the existing default image, preserving
> current behavior.
> 
> This change enables DDR training data reuse when available while keeping
> the existing training flow unchanged for devices without saved data.
> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>   drivers/bus/mhi/sahara/sahara.c | 47 ++++++++++++++++++++++++++++++++---------
>   1 file changed, 37 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
> index 4ea14c57774f51a778289d7409372a6ab21fea60..0a0f578aaa47ab2c4ca0765666b392fb9936ddd5 100644
> --- a/drivers/bus/mhi/sahara/sahara.c
> +++ b/drivers/bus/mhi/sahara/sahara.c
> @@ -61,6 +61,8 @@
>   #define SAHARA_MEM_DEBUG64_LENGTH	0x18
>   #define SAHARA_MEM_READ64_LENGTH	0x18
>   
> +#define SAHARA_DDR_TRAINING_IMG_ID	34
> +
>   struct sahara_packet {
>   	__le32 cmd;
>   	__le32 length;
> @@ -365,16 +367,41 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>   		return 0;
>   	}
>   
> -	/*
> -	 * This image might be optional. The device may continue without it.
> -	 * Only the device knows. Suppress error messages that could suggest an
> -	 * a problem when we were actually able to continue.
> -	 */
> -	ret = sahara_request_fw(context, context->image_table[image_id]);
> -	if (ret) {
> -		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
> -			image_id, context->image_table[image_id], ret);
> -		return ret;
> +	/* DDR training special case: Try per-serial number file first */
> +	if (image_id == SAHARA_DDR_TRAINING_IMG_ID && context->fw_folder) {
> +		u32 serial_num = context->mhi_dev->mhi_cntrl->serial_number;
> +
> +		fw_path = kasprintf(GFP_KERNEL,
> +				    "qcom/%s/mdmddr_0x%x.mbn",
> +				    context->fw_folder, serial_num);
> +		if (!fw_path)
> +			return -ENOMEM;
> +
> +		ret = sahara_request_fw(context, fw_path);
> +		kfree(fw_path);
> +
> +		if (ret) {
> +			ret = sahara_request_fw(context, context->image_table[image_id]);
> +			if (ret) {
> +				dev_dbg(&context->mhi_dev->dev,
> +					"request for image id %d / file %s failed %d\n",
> +					image_id, context->image_table[image_id], ret);
> +			}
> +			return ret;
> +		}

This is entirely redundant with the else in the next line. I don't 
understand why id 34 could be reserved for training data, but also be a 
valid image if the training data was not found.

Just have the if that looks for the training data, and an if that if 
there is no found image, do a normal lookup.

> +	} else {
> +		/*
> +		 * This image might be optional. The device may continue without it.
> +		 * Only the device knows. Suppress error messages that could suggest an
> +		 * a problem when we were actually able to continue.
> +		 */
> +		ret = sahara_request_fw(context, context->image_table[image_id]);
> +		if (ret) {
> +			dev_dbg(&context->mhi_dev->dev,
> +				"request for image id %d / file %s failed %d\n",
> +				image_id, context->image_table[image_id], ret);
> +			return ret;
> +		}
>   	}
>   
>   	context->active_image_id = image_id;
> 


