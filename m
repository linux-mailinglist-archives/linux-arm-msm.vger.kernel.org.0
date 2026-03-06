Return-Path: <linux-arm-msm+bounces-95810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDSRCdrLqmnUXAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 13:43:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CF239220D78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 13:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C0F65304EEC9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 12:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 764F429ACD7;
	Fri,  6 Mar 2026 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g0mRvaQH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V5Mw/wv5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1AA28C854
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 12:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800881; cv=none; b=spMnMrWiw8RMQ8/8NEh5vvhZ9g/2QYZmMA30jDlj1zduhm4dRfrC5FSSI1Qh7YTKkqkIAUw7WnrEH1l7+T3O6EtoxPzU0q0U9yAX5xHrx1lGilbwCOU7wpbYtLdTG/xObILjAdPr01FFBYE+lgXOfSnaEtQblsbIsvqEyE1Un7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800881; c=relaxed/simple;
	bh=uF7FeyQrYMijCgWbj69YdKgeI/mux8GE7Fl7Q+vaG4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o9aNYg9ieTd8Q0YxgE3QJs9XTEabr6J3E2YBBcltYL46AbzOCKvQsJF4o4+H7pw52XLFMQwmQqKOEGkpR11D4Q0tQMEX469Ivhq3saISH+jxs71JHZxRS+SOIa+85qln3sdYoXHkALFbFJWC1Jefe8DSRcxXCRXBcghdPGUtyNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g0mRvaQH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V5Mw/wv5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbK9r3257106
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 12:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	th1itqMbs74IRL2O00rpVuDnvWp8kNZ4S6kCMjIQqT0=; b=g0mRvaQH2xLIkVxe
	O9x4vc6XXRUqObKh92tHzLbIrRL2E7QmZrfqFRVVCF6aCKy5AIRWaVa9y1qwFI7z
	GA5SQrKqhbVR+6jNNhdz9XD8+bCNye8mZOtHi56gxhf5211y6EX5AUQM5ysKhdKG
	bdHfyKIkeHQxi4PJ53kzbKSgGp3XXJivm19ShidNUgzBWysgISHh6exBlCvMdnL+
	bMyNjB3EjgtOkw0GB1okKC00l7yF9E83K0bDRhn4uDLq2KGuewZ2UIcV2K4Ka86w
	lVW2wsJFCzMEYcshQZp5P6bE8VHqrdIpwgckSrY7KTDFVt9D6R83db9lfR5UDN4Y
	xsfJ8A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqg09u3a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 12:41:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3568090851aso48894112a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 04:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772800878; x=1773405678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=th1itqMbs74IRL2O00rpVuDnvWp8kNZ4S6kCMjIQqT0=;
        b=V5Mw/wv5dVHiI2YmR3NnC4ADnHryC+44ZF2ecXt2u86iD2nDLWM3+BtPmFMzKNeBZp
         QXHyv75hxn4pViTaezct0yUyA/Lzn/A6FHCmXW3v+9zuJrybjk3bIo4N6/JUPxovbN5l
         eeDZpBwsgzlQ3FzehlWFLl2NQLgdTnGPsEbA+u1jM8a9QHg2HomemUHViUCSs0zHeuX6
         PkiKVkyjHBDWIjsM8LbztW7Y6hYlYcMVoCQnvO9/Es4Tv8J6A+OIx8grwt4Mmn5UkPAH
         CSFMFJTUeiqwgBwF32I/19UPoN6Py8E5PSHtsglb9iO3Z1+ix1nKsUAbw8jGKVCvFyHf
         P61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772800878; x=1773405678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=th1itqMbs74IRL2O00rpVuDnvWp8kNZ4S6kCMjIQqT0=;
        b=GVZ/fZnV1JVzMD4VSxBIjP1cMABc6cMGF2ScYy8gXY/v26Vj9LtIoYDW5uhoUjrfpp
         7P93/KyGFFbnwlabLBMxUy2B2vKjcg9/LlLAw7OZwm3erxQSRps9/ACRZgOXZg980KHP
         C4k3ZGneYtm56eHGWTEcKwWnO+JXG/PiPpgIfmLfpNlX/OaiCZIm5IjWTLbLiK3rl8UK
         KlOCPorjaGQtcOAkQupit51plg3nwUkA2/fKJBf/gbv8ywaH6l9OMg2tC+fXew/9ThNi
         a1JcJCTg3huS7mFc6gbWzYKga9PoOkwlRUmh96Dbfedqj9vsi0PSnKi3ooRJlYeNr9Lb
         HL+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfFPWW/vFUycR9V0x1HgZiVinEoHNXs00SqtBD0XKW7CtFpAeV7gS23G6WIRgG6W3AmInPSm4kyfNWWdT1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5dhfiL4UMswANuWW2LJp+Cd2L9nBa6OoRPhWtYMvNHLnmPnpV
	mSq9vuxABa9D6xU0Xn++UP1FrDsz15i3LmPpGyPLiTE8NWWJduS82Fih3XxmD3PBPGkDLCqhkIg
	GXX2GfgPOJFgIDhptRySGeTqJY9kJP2rm3ug4/HsjxEToB/aPBlK/+1yr1Q4/0bfZh9oM
X-Gm-Gg: ATEYQzy+kKxDIgxRqGFc/k5akZ1+P7+zL+UUMPEn1zqbRWgOsmcvlVLpliaQxj0JHDg
	QeQVW5m/35Jz66PpGxGZLIji6EXS4UG6FGroYGJLm95pzZk2BOPVZD8VOlZ6cslJBRFxmHrPbea
	2jJB0Rp/lWR6Vvh2aa5RZVkrcExmQd2E2gU+oWacQmRDCpiN9xOT6/Vm/6Uwqc76wNP7gFLxXSB
	6PviE0Gn4JdQEt0E5RrW4zCUEHgjQWpb4CJlxVxosrZ/2FjQ+9iD9ImCLvpfieF/386z5+oEZCH
	504GFRphd7eEeBJ6hBrSLxq/9tFxP8ci2xO9vtfv/g2FxcaeEN0E5azpiZ4QzviumhshVbwBJIh
	GdP6MGOV9d3YGBVM+DdgRZRPW7Hm3EIsdXT+lzayuc46WkyBp5ECEXod8vCHWSZtJBrGroktxWY
	Qb6ZpTbPAFYMA=
X-Received: by 2002:a05:6a21:498:b0:366:14ac:e1df with SMTP id adf61e73a8af0-398590e0f3dmr2322251637.69.1772800878396;
        Fri, 06 Mar 2026 04:41:18 -0800 (PST)
X-Received: by 2002:a05:6a21:498:b0:366:14ac:e1df with SMTP id adf61e73a8af0-398590e0f3dmr2322211637.69.1772800877795;
        Fri, 06 Mar 2026 04:41:17 -0800 (PST)
Received: from [10.133.33.226] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e0f15f5sm1673727a12.15.2026.03.06.04.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 04:41:17 -0800 (PST)
Message-ID: <1609ae14-888f-46b5-9e8c-1aaa50b803c2@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 20:41:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] scsi: ufs: core: Introduce a new ufshcd vops
 negotiate_pwr_mode()
To: Bean Huo <beanhuo@iokpp.de>, avri.altman@wdc.com, bvanassche@acm.org,
        beanhuo@micron.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
        Ajay Neeli <ajay.neeli@amd.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Wang <peter.wang@mediatek.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Stanley Jhu <chu.stanley@gmail.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Archana Patni <archana.patni@intel.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-samsung-soc@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>
References: <20260304135313.413688-1-can.guo@oss.qualcomm.com>
 <20260304135313.413688-2-can.guo@oss.qualcomm.com>
 <15d49cfb52990dea46596c2eb0cbdc7db9c44ab1.camel@iokpp.de>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <15d49cfb52990dea46596c2eb0cbdc7db9c44ab1.camel@iokpp.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uesNZywaqgSuRDTRkKsZmkiziEk-6TWv
X-Authority-Analysis: v=2.4 cv=b/u/I9Gx c=1 sm=1 tr=0 ts=69aacb6f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=o_XSaaT3ieLpCecdYGcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: uesNZywaqgSuRDTRkKsZmkiziEk-6TWv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEyMSBTYWx0ZWRfXzbN4vacvRnDT
 eWClt6dE7gAiu0cLDjKygm1BhAW7UPn+U3T3mgbC3YVDB0gtRgjiBUynx0ei8ib3bVlYloUe7S8
 +PnCiugtZoFTdOeSBXGWCWe8V5zZsbVqTiCKaKpUPA5MzUwwq8Ac7MXGkfYgAjXc7eYWwwqUBTl
 2bUG7w4WozWksCrgQl6QaLfV6oYr3ov0MbnOBCaH2N1RgbpMYuDcD8e8rKh5Zybzga+lsZ34CxF
 /rcT2iDEE4PuWIpaLWOTP4nvIg7hwcGXCYciLPFiEd+KxWt93iLjW8R1+I+KYqiSQGlM/fhFpJi
 tOM9cwRJBHxH76/ANkooKL3O2SIjuvFSH9xVsshUkprFx1tqcx1vVMDxMbZh32uHy2bOhBtEQBA
 J57Yt01TJD4X4C8+7ACQsR6y4b6hEXXm5oraUnJ/m/rLG+5h8M6/HS79kiQAh4dC6LPivZbPdtz
 qvB/FOZsfkBOeJwFgzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060121
X-Rspamd-Queue-Id: CF239220D78
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,samsung.com,HansenPartnership.com,amd.com,linaro.org,kernel.org,mediatek.com,gmail.com,linux.alibaba.com,collabora.com,quicinc.com,intel.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-95810-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Bean,

On 3/6/2026 5:03 AM, Bean Huo wrote:
> On Wed, 2026-03-04 at 05:53 -0800, Can Guo wrote:
>> @@ -4747,6 +4745,22 @@ static int ufshcd_change_power_mode(struct ufs_hba
>> *hba,
>>          return ret;
>>   }
>>   
>> +int ufshcd_change_power_mode(struct ufs_hba *hba,
>> +                            struct ufs_pa_layer_attr *pwr_mode)
>> +{
>> +       int ret;
>> +
>> +       ufshcd_vops_pwr_change_notify(hba, PRE_CHANGE, pwr_mode);
>
> ufshcd_change_power_mode() calls pwr_change_notify(PRE_CHANGE) but ignores its
> return, this can continue with invalid vendor prep? I saw there is checkup
> before, do you think adding check result?
pwr_change_notify(PRE_CHANGE) was used by most vendor-specific 
implementations
to negotiate Power Mode negotiation, if pwr_change_notify(PRE_CHANGE) is not
implemented (returns -ENOTSUPP) or Power Mode negotiation returns error, 
the error
check was there in order to call the memcpy() to copy the desired Power 
Mode as the
final power mode, that is, an error return from 
pwr_change_notify(PRE_CHANGE) won't
lead to skipping the ufshcd_change_power_mode().

So, to introduce the new vops negotiate_pwr_mode() and keep the logic 
same as before,
in this patch, the error check and its error handling are kept and 
coming after the call to
ufshcd_vops_negotiate_pwr_mode():

int ufshcd_config_pwr_mode(struct ufs_hba *hba,
                 struct ufs_pa_layer_attr *desired_pwr_mode)
{
         struct ufs_pa_layer_attr final_params = { 0 };
         int ret;

         ret = ufshcd_vops_negotiate_pwr_mode(hba, desired_pwr_mode,
                                              &final_params);
         if (ret)
                 memcpy(&final_params, desired_pwr_mode, 
sizeof(final_params));

         return ufshcd_change_power_mode(hba, &final_params);
}

I hope your question is answered.

Thanks,
Can Guo.
>
>> +
>> +       ret = ufshcd_dme_change_power_mode(hba, pwr_mode);
>> +
>> +       if (!ret)
>> +               ufshcd_vops_pwr_change_notify(hba, POST_CHANGE, pwr_mode);
>> +
>> +       return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(ufshcd_change_power_mode);
>
> Kind regards,
> Bean


