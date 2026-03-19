Return-Path: <linux-arm-msm+bounces-98620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLAALg2Iu2lvlQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:22:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BA05E2C621D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9FCAB30185FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 05:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1937C399017;
	Thu, 19 Mar 2026 05:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LjEtOZxg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="awfWVzbF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AEE33D51F
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 05:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773897728; cv=none; b=eMH0MBnbIr/hznSlscWTwjXaHoQ12xPSEEp+W9+2Ut1SofZSg2+dRx3vNhR5zdNck5MzDjIqsXkLqNV3nVfPgeiXoIQPbuNPOVbjPIjsNG9qpKBYTtaBQ6JByPh8RH1L4WMOkBXu8lTg7ZZK8XgUfWdoMNiVzBLc9Jd0Oi8yOyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773897728; c=relaxed/simple;
	bh=a5iiqO1Am2OWCq075yZfw2R1p/EIkUJTHJLlohpIPmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b+4wrynl1Aj8pdRdUiqM9CtaJi/Xo6YP4bImKfEC5+24tIAJy7nmCqTAA03Oz+mBRhWaE57fgVj5mxTTDlS/R0ohVKKRLy2op0csZRYqgOQM75EEj+Eb0sdW+XLY8U7kPQzhRLTpR8pZ+gHHPkiLd9g6MokYXVdFeVfl7aSsKsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LjEtOZxg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=awfWVzbF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J2cTA23413864
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 05:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4I8/5ez3q2OJRFcbgSMBcsslv1AdLgBA/kvA1ffDk1Q=; b=LjEtOZxg7h7xv8gN
	FixCK5mcVT/TUuTAKxHkXBxQTM/HxbFQWAi+Ur+GHjEhPVeaaPVYKAFI4vNGIC93
	zbnSLmRS4S9yAMqlzZZYENJlVDNMfGyVzz/kfPxSRgQoUxHJwsiZecw25Uokd0Zn
	tODeVnrEeHcx35O+JWurKO2cK/p8jVa+8Svem4JQYkN3oqS7IbTNPtoSEg01WQRy
	yGBy1GYJlANI68WotDUk8vc8qSWNbG/LcJpoLkWPM0wBG6Gpl5/REYjY/JT4Lkrz
	NxX/EfimjjwN0q4gy/zbukRF8nBuXYIouc0vgA1V8PWbyUYSFHIsnBh9l1M3y5Hd
	Hf2Jlg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0032j04v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 05:22:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c0cb775215so14318713eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 22:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773897724; x=1774502524; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4I8/5ez3q2OJRFcbgSMBcsslv1AdLgBA/kvA1ffDk1Q=;
        b=awfWVzbFnZ0pqmVdh68DtJzQJRV1FvDA/7OtTCmCtwBpmEduCgfSLVDgpxhSZp7XP+
         zIXT52OTcFH22O3E0W33fxMK+K+ilGXsnsdrqSR2NDMm6oTwXI3kjOaOZcu1CIcdU0YT
         bDXAcnpJ713QALYahVcRykFEJWluQtWYxuFOOk4rWu5PH0rmniVo/OUtRWeOwGjLhyEw
         nN1BvdHXxxrddnvN2D6GWqaTJF2HYsPJHd51RweteXXoO7iURkmoZLFGyEPDowC8/ma5
         UtIaTdclJ01sSy4vOa1VUHLpJy67xXToTcab6fC9jFKCsuuQALnH073fVhzasALbtLcN
         anhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773897724; x=1774502524;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4I8/5ez3q2OJRFcbgSMBcsslv1AdLgBA/kvA1ffDk1Q=;
        b=TEDJMlN813O+3wzrftWzXfsiuVS9AsHMA2XbnXd7UOkMDCMkyj4nKTU2n3CQKxGcIH
         9a9dJ+dpXGdiQruEahQ0nWeQWM2Zqmp9Y4zhBlPToSuuBEvmGhmp1tAUZyfzyR87KJ0G
         JlGt+vUgBmL91bSabFj9LWaIL2Gp07lO5KLah0kkOod1I4Qj2mTsJXIuBChCqXQXd8Jw
         EfHsyqPN41kb3/EEqOZtgE1GxoJQ/MbyvSTHMLqmCU5x0ffqs7EsI+YwJyPmghglrLX3
         o5+wW4UA0WkBYFQXScEPKlDGfGZ8ApHvRCzf+oADt5WgOj8NGgh8O8j0bU1NmqxzBsmV
         bwxQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6e1dBwPdPz4z+MmtY/vG6tAA4oBYfoxjMzuMm2QnkHqPK+RRPKHGlktM2GQYUqiLrz9mBxnLqEpf2m1KF@vger.kernel.org
X-Gm-Message-State: AOJu0YxCTCSugcZoRMDuD+sh8u4gFSSoGyw72aQndnhNvzqMhS0SDq+c
	0rFhZQXTXFEv4428bdfJDTj1mhhPKlPyVv5Ex92GWW9xP2/1AuTm/LPUVS0x3rAmzBcPNXv4C58
	MVk4/PehlWuA/bZ1XZ4LdMCCnJgtbQ137YHpo3N7FrztxMKTgSxclqXXij78P1OHCWZTy
X-Gm-Gg: ATEYQzy8rKo6dMh/UbT7D5gXo3hh/Ld6t4Y+IU9bJyC4i+nFS5QspDGHRa2C6k8cGUf
	/yLsHbpaGvM8qg87qxwJMWRVAEUb8AS7Lt2870O5c/F71Q41U1G4jpLj9ftWVx35CzRKkfyy8X2
	4co36OqOt5XMVZOAX6UlIjnWfDnONXaB1GdRjZiDAHhq4pbJG/4fDqy3fErTa5+spbyqdZw6qVf
	fvon7p3IAD1kNwt2ZKTmfvOBHN506SOHu6B2wMpRs1oRrM1PnuUreE3kLEA3CDVb8bi3vI3Vwym
	5XjST0sXGL8mvIy3St3FJ/46/ArHLp0XbGF81bGrTmTPGrf0Z9h8pbjiuVsqf0mB03hRoiI6CJ5
	gy34kda5+rGrjb37hv6dFV/p1qTRuAoiHo5VV+LmQ56c08qKXunb4PguYE/jbaPS3b4sI8JIi1x
	s=
X-Received: by 2002:a05:7300:cb0b:b0:2c0:c27c:339e with SMTP id 5a478bee46e88-2c0e50423a6mr2959126eec.25.1773897724485;
        Wed, 18 Mar 2026 22:22:04 -0700 (PDT)
X-Received: by 2002:a05:7300:cb0b:b0:2c0:c27c:339e with SMTP id 5a478bee46e88-2c0e50423a6mr2959121eec.25.1773897723954;
        Wed, 18 Mar 2026 22:22:03 -0700 (PDT)
Received: from [10.110.94.9] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e559ff3fsm6714643eec.21.2026.03.18.22.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 22:22:03 -0700 (PDT)
Message-ID: <1603a5b0-8edd-4c31-b2d1-344ee7df10ac@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 13:21:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Bluetooth: hci_qca: disable power control for WCN7850
 when bt_en is not defined
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
References: <20260319031040.4096297-1-shuai.zhang@oss.qualcomm.com>
 <mcjloavd6jhinb2wgfwihsdtbay5n7zv52tn63kzrabcqwyp26@mh5aet76kl7t>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <mcjloavd6jhinb2wgfwihsdtbay5n7zv52tn63kzrabcqwyp26@mh5aet76kl7t>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wRsOQuV4x-7XWZe8wnkpnr3poREnYV30
X-Proofpoint-GUID: wRsOQuV4x-7XWZe8wnkpnr3poREnYV30
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAzOCBTYWx0ZWRfX3BfjFae6pjjY
 MGKRgorhGmNveuNiB8ms9EyYTt55mCZnm9+i2Im+4YE7NKmS6+WfxC+URBmsSo8EHhfofXaV8Dk
 FPO+fkHZ5l8+B081fzhYm2BNkcb7ayyck+rNCQu0TeGeROGXCXfFGUeOu45XDD7g7Op5khh5xcb
 MaA2cnzr389IXpet8ID9pT5LoSbO2hr7V6FKxZmjei2zt2z1hJ3sNQHOtPTKhpvYklVZ1K9PEd7
 8nIWK+97vgS5g+K8cUHCnY98QinbSEcw7oZ2fLaIWG3YpUaIEXv/7TJwYFuTAls68O5fg18Mynm
 vpzxUvnCprx8zRx/eQP4dQTWde4cdyWaFez3Uhvx8CYEDHlet3lMgBzLXAGzzgnXGSuj3XS2Fdt
 Bqr+Kk8oLV9MYILGXacAR2RWK447/gdlJLie/SlONA4Dbr7H6t5KqTt5Fe1Vilouwbb6Cl1yZFj
 CiVRmUtMtADJ0xFhs7Q==
X-Authority-Analysis: v=2.4 cv=WO9yn3sR c=1 sm=1 tr=0 ts=69bb87fd cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=AYBSpBTACJuzp8GJotcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190038
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	TAGGED_FROM(0.00)[bounces-98620-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BA05E2C621D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi  Dmitry

On 3/19/2026 11:51 AM, Dmitry Baryshkov wrote:
> On Thu, Mar 19, 2026 at 11:10:40AM +0800, Shuai Zhang wrote:
>> For platforms where the bt_en GPIO is not defined, software-based power
>> control should be disabled when power is managed by hardware.
> What does it mean for this chip, managing the power in hardware?

bt_en is pulled high by hardware, or described in the device tree as a 
regular always-on GPIO.


>> Add QCA_WCN7850 to the existing condition so that power_ctrl_enabled is
>> cleared when bt_en is absent, aligning its behavior with WCN6750 and
>> WCN6855.
>>
>> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
>> ---
>>   drivers/bluetooth/hci_qca.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index c17a462aef55..4512ff7cd0c0 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -2484,7 +2484,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>>   
>>   		if (!qcadev->bt_en &&
>>   		    (data->soc_type == QCA_WCN6750 ||
>> -		     data->soc_type == QCA_WCN6855))
>> +		     data->soc_type == QCA_WCN6855 ||
>> +		     data->soc_type == QCA_WCN7850))
>>   			power_ctrl_enabled = false;
>>   
>>   		qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
>> -- 
>> 2.34.1
>>

