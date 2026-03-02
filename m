Return-Path: <linux-arm-msm+bounces-94839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJ7IAXtipWmx+wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:12:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE461D621C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EF4E23017DF4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82D9396B7F;
	Mon,  2 Mar 2026 10:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pHv8Y92O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SEjWzZiI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57CC38F655
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772446324; cv=none; b=E65nLNjDuBvZlaxHSgrVspceUGa7YEfsdNz1LjqXXsR/kHk5kgiSj6m9anwsmUmXAf1Md4IEA6DhL3keX+NZdDtYzYpyf2MaPhvqZG/zrySGzSfjsKhZYvSzcoQeOG/+ro1glpCdMv4ua8ZUy3jytTWFMBvI9ZuG7oV7N7gay0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772446324; c=relaxed/simple;
	bh=txdY5rJ/ZRLNRF9fgeSs9EjL4oxzE2aFUDw8jLdrJpo=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=F2weV0fkpe5BesYm+3vi5r+7MtUZd7JGxa/+bKeQmYEP1+eu1x7CKZWw2pENnhPnaDbq3GPUn3lNQ527x+yykP9DQNCPFVhyf6IcKF5G9d27vsKjeBrbbSR1YmPUXw8uuDAzeUWfq63z8mMWsNjPLS37IXMdSGQJEQDQWT+kUBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pHv8Y92O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SEjWzZiI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62294XM83753016
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 10:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qYtlAUqEB4PsAxcph4isW3Atz2Cxuy6C5HTehGmJZIc=; b=pHv8Y92ORgWuZQvE
	Dv1vZHnzRiq4Rxg9Qf8YbmYZZwspNFX1eMLxm4EVDF59j8BZYcZchO6Zuix0W10T
	hsi3o8pvD8cB4mzvqNyMntd2em0PjXOGroc/ONvosYqN7Amq56YZxVD8eMU0zS1L
	wYZ91dZ3mwpo+L/UN9Y3AC28sMEM2VL0QFbFKa7pkpz2q5KuWus+hoZLOOUNtdgI
	qhaF3SOBzjBGGVxd3uO+vKxW7vMOFZYrumSrPz6FhMgw7+Ktp+96WJNVxyzkUHMj
	XiS48K1tCDxX3PiafQj/eMUEun25FNNTu8LFIx8qnuTPpRer5JUq5CwUVT7YkNLX
	+wxnSQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7kq88h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 10:12:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8274dbdbadcso10458646b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772446321; x=1773051121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYtlAUqEB4PsAxcph4isW3Atz2Cxuy6C5HTehGmJZIc=;
        b=SEjWzZiInW1PZPVefcOKX8V9USzDQ8+NwpVNAwQSoYe/QWvUR0Ggjgy7yVYhFO0wVV
         SHMb75sIKRfb1V/+ZML4lAYbytD5mhmtIiMCk7tVQ0WHwd3BPtcY2GYVm8VAMuUoPy7d
         T17QqtKnzBzAwcxdlloLQ6fNUTESbVLpFPLgID+c+ORf1HwZIRQDwMOXiQOB2kQj4bJC
         BE+efFHM0RKaV9exb3CmX8uhGBk+1WCqbSXhMlaTeyHAhk9SptXY38HPmQPQQH2qVC+r
         nsLsi+ZB8g9SRS5D2gb16uqdpAPyeEEHfpLj+425yXXvbGihlxP3PPsSIh/6G2zdGeed
         Zt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772446321; x=1773051121;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qYtlAUqEB4PsAxcph4isW3Atz2Cxuy6C5HTehGmJZIc=;
        b=VCV6ixTfd8u6fhRAXTfqc4lFhQWgiuawUHxjpnm9QOkil1U0fiW9ahhYbCfBvVVKtl
         5Rj2PuvkzGu/yRpK9oCuNq5ISYh5Rq9Xl387O/asLkTmpBpz2MgHiT/imQPLjdwCwTeD
         KrFhLvQAoh9HKasMQB8buh9JClutHoKiK1P/WVixng/Gkuczv4qQpyW0qFurnlcp/3kz
         Q8stgLUnDv9VKYoKhANQtuw+pb3QwYTaKWNAW1E2Hw50KiIxWOq+Ua3bd/LY3W7BCV6z
         RXEAWlWJs8sljlH4PLfZ5kraMcNpXvdCgHVs5gknkJXNUC8vgw/+kvOA/h0IzjrgMSGI
         YNrg==
X-Gm-Message-State: AOJu0YzaNDVlMv6gZecWEz9lOBQ/NTWnH3WcOBASZIh9ox3Hjlb2EIxn
	o5oyGOMK6onHHK3HFqVOgDa6QIz1XNMGbWVRGc/sbr0pZSecUdluBcUPkbQMg4zlbeoWgVUzcPS
	NyLSDZMR8c9U8y2SmBSyxjACJEfL2XVnctqEEp8UpUC2sGxgV6wM5RkDQ39+nHXqXb09U
X-Gm-Gg: ATEYQzzKL5xg2hpekt/PdZB2PmAAS5S+3WvBpimJaeuYxgWDzo2ahyayIxEk8EZyFFe
	1MlKPtvEYz/qcyOhpga88ykKZXL6ZHC7nWlviQ5RDB1ENYn3AiCrGowKd/mx5DeHByenQox7pzX
	ZHZzrUzgTxsJkSPNRwU26gSzL7XRqxjS2c/CKnw+51N4ufnECtStgoSOnfzmpj4Fi1XEv0j0tH8
	fgBHQJfnkc5yxlIt/aGmlLt/PwghBB5zUTeLSmPp01skn5UWdtp4i5aDHfJyzQ1DlrB6TgPd1Ka
	ySPTpXXgNr1k9HvC2qPZGRH/0ByuIU+6viuKcjAHoFWtSy7z0G6vwttN+hvEGzWCUPGaa+igxMV
	Er6t1AQLZYAzPypTmrk2mVKDys6ypTw3o6KpPb+X9tAp6VxbSgg==
X-Received: by 2002:a05:6a00:4ac9:b0:81e:408e:47d2 with SMTP id d2e1a72fcca58-8274da12e28mr9293447b3a.53.1772446321167;
        Mon, 02 Mar 2026 02:12:01 -0800 (PST)
X-Received: by 2002:a05:6a00:4ac9:b0:81e:408e:47d2 with SMTP id d2e1a72fcca58-8274da12e28mr9293421b3a.53.1772446320642;
        Mon, 02 Mar 2026 02:12:00 -0800 (PST)
Received: from [10.217.222.63] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4c910sm12494189b3a.8.2026.03.02.02.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:12:00 -0800 (PST)
Subject: Re: [PATCH v3 1/4] soc: qcom: ice: Fix race between qcom_ice_probe()
 and of_qcom_ice_get()
To: manivannan.sadhasivam@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
 <ulf.hansson@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>, stable@vger.kernel.org
References: <20260223-qcom-ice-fix-v3-0-6ca5846329f7@oss.qualcomm.com>
 <20260223-qcom-ice-fix-v3-1-6ca5846329f7@oss.qualcomm.com>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <5e9a399a-074b-4b41-2e10-f2ed654eafcf@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 15:41:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260223-qcom-ice-fix-v3-1-6ca5846329f7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wcy9cXdbkhoiO2uGa8BfkLXrgKfE3l_T
X-Proofpoint-GUID: wcy9cXdbkhoiO2uGa8BfkLXrgKfE3l_T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4NSBTYWx0ZWRfX3kMH37FWR78i
 8eELF79OsXJkZ/VmuxbROKQQTuflPt1klUZVCLvIYVcL2b9JPOLsEFZNIxmgTM4mkPVgixx+BGw
 1TyGxbuSK+NbSGOJM6n1tBiC96g7tw+Q5fAXyJ0Cql/4R35DJ/+VpRyDMwdFqNXJKXINokLXfJR
 6oHyuDYHBWLCbh8CB4+3beF0jzdZb5GvTRafuuIUyvtzEf2rmFzcoZ1ARq1k0XUBAX6nuL49dFJ
 maxO/KSca8uCPUGV1Em7gFzL0/U12SlflfO1ZA9QeeD4N0a4g1x+vxdqYqzAuWkHEUD53K0ZawI
 mKJHPevXDAQ7kJJgjw12TmshYSo6DEc0Eyvin2W+hZwLdMrYdX0Z7RBG9agoYwCy39aOIl8j6Xj
 NhF+2ccqw6uktxWHW5vRuvRSYOKi94Gi18ZleaRsRCMhfUyHm2CzUJCBTF3QgylpCNiMXVv7dcS
 6B86ObH6ZlFKOIOdYIg==
X-Authority-Analysis: v=2.4 cv=GLkF0+NK c=1 sm=1 tr=0 ts=69a56271 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MqxRADgNEBqUf3RlVf8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-94839-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neeraj.soni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9BE461D621C
X-Rspamd-Action: no action



On 2/23/2026 1:32 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> The current platform driver design causes probe ordering races with
> consumers (UFS, eMMC) due to ICE's dependency on SCM firmware calls. If ICE
> probe fails (missing ICE SCM or DT registers), devm_of_qcom_ice_get() loops
> with -EPROBE_DEFER, leaving consumers non-functional even when ICE should
> be gracefully disabled. devm_of_qcom_ice_get() doesn't know if the ICE
> driver probe has failed due to above reasons or it is waiting for the SCM
> driver.
> 
> Moreover, there is no devlink dependency between ICE and consumer drivers
> as 'qcom,ice' is not considered as a DT 'supplier'. So the consumer drivers
> have no idea of when the ICE driver is going to probe.
> 
> To address these issues, introduce a global ice_handle to store the valid
> ICE handle pointer, and set during successful ICE driver probe. On probe
> failure, set it to an error pointer and propagate the error from
> of_qcom_ice_get().
> 
> Additionally, add a global ice_mutex to synchronize qcom_ice_probe() and
> of_qcom_ice_get().
> 
> Note that this change only fixes the standalone ICE DT node bindings and
> not the ones with 'ice' range embedded in the consumer nodes, where there
> is no issue.
> 
> Cc: <stable@vger.kernel.org> # 6.4
> Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
> Reported-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ice.c | 44 +++++++++++++++++++++++++++-----------------
>  1 file changed, 27 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index b203bc685cad..3c3c189e24f9 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -113,6 +113,9 @@ struct qcom_ice {
>  	u8 hwkm_version;
>  };
>  
> +static DEFINE_MUTEX(ice_mutex);
> +static struct qcom_ice *ice_handle;
> +
>  static bool qcom_ice_check_supported(struct qcom_ice *ice)
>  {
>  	u32 regval = qcom_ice_readl(ice, QCOM_ICE_REG_VERSION);
> @@ -608,7 +611,6 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>  static struct qcom_ice *of_qcom_ice_get(struct device *dev)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
> -	struct qcom_ice *ice;
>  	struct resource *res;
>  	void __iomem *base;
>  	struct device_link *link;
> @@ -631,6 +633,22 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
>  		return qcom_ice_create(&pdev->dev, base);
>  	}
>  
> +	guard(mutex)(&ice_mutex);
> +
> +	/*
> +	 * If ice_handle is NULL, then it means the ICE driver is not probed
> +	 * yet. So return -EPROBE_DEFER to let the client try later.
> +	 */
> +	if (!ice_handle)
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	/*
> +	 * If ice_handle has error code, then it means the ICE driver has probe
> +	 * failed. So return the handle for the client to digest it.
> +	 */
> +	if (IS_ERR(ice_handle))
> +		return ice_handle;
> +
>  	/*
>  	 * If the consumer node does not provider an 'ice' reg range
>  	 * (legacy DT binding), then it must at least provide a phandle
> @@ -647,24 +665,16 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
>  		return ERR_PTR(-EPROBE_DEFER);
>  	}
>  
> -	ice = platform_get_drvdata(pdev);
> -	if (!ice) {
> -		dev_err(dev, "Cannot get ice instance from %s\n",
> -			dev_name(&pdev->dev));
> -		platform_device_put(pdev);
> -		return ERR_PTR(-EPROBE_DEFER);
> -	}
> -
>  	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
>  	if (!link) {
>  		dev_err(&pdev->dev,
>  			"Failed to create device link to consumer %s\n",
>  			dev_name(dev));
>  		platform_device_put(pdev);
> -		ice = ERR_PTR(-EINVAL);
> +		return ERR_PTR(-EINVAL);
>  	}
>  
> -	return ice;
> +	return ice_handle;
>  }
>  
>  static void qcom_ice_put(const struct qcom_ice *ice)
> @@ -716,20 +726,20 @@ EXPORT_SYMBOL_GPL(devm_of_qcom_ice_get);
>  
>  static int qcom_ice_probe(struct platform_device *pdev)
>  {
> -	struct qcom_ice *engine;
>  	void __iomem *base;
>  
> +	guard(mutex)(&ice_mutex);
> +
>  	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base)) {
>  		dev_warn(&pdev->dev, "ICE registers not found\n");
> +		ice_handle = base;
>  		return PTR_ERR(base);
>  	}
>  
> -	engine = qcom_ice_create(&pdev->dev, base);
> -	if (IS_ERR(engine))
> -		return PTR_ERR(engine);
> -
> -	platform_set_drvdata(pdev, engine);

This allows the driver to set the data per ICE device instance which allows
the addition of multiple ICE platform devices. For example this patch:
https://lore.kernel.org/all/20260217052526.2335759-1-neeraj.soni@oss.qualcomm.com/
utilizes this capability. I think it doesen't harm to keep this support. 
Moreover, the issue which your patch intends to address do not need this to be removed.

> +	ice_handle = qcom_ice_create(&pdev->dev, base);
> +	if (IS_ERR(ice_handle))
> +		return PTR_ERR(ice_handle);
>  
>  	return 0;
>  }
> 
Regards,
Neeraj

