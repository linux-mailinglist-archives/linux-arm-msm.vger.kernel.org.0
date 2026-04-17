Return-Path: <linux-arm-msm+bounces-103465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id x/FIGa+24WnpxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 06:27:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF521416D5F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 06:27:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79CA730A5D74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 04:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93B9346E4A;
	Fri, 17 Apr 2026 04:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJQ79aaL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dJ22vFhX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0B02F12CE
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 04:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776399806; cv=none; b=Ot726GbbARKkQf4WvlkplO2UW1R/tJZKyrLxomiPmDfUljvWiuK9tvGxT5xkbEGLn9BmjEdW9XRge769aEMVdgBkU7Zy8pq1LEFWFQuGcbrfuTYnkAz4NSgZz7vErwlsReE28wwmKvYqGYMJPbNs5EHPL0FuSIOCKNP4epOS4jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776399806; c=relaxed/simple;
	bh=qKc0gjAZUePsNOZh83kahRoAT6OgZLpdshCKxlrNPCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iC4DlsnzM2UMCZaWkq/IFP1jr41mNc5/Cz9G9sDKOtoLf/XB707uzjua+4Ceo8C16j5NXr2O1cePNljPA6H3NiCUADt8gJawbYQkqNabadP8Nf732vVzPxWK2Ui3CqgYOdm2AclR6E61zeldj541WwgE9wTmBUt7zQvARIZOilE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJQ79aaL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dJ22vFhX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H0fb4c1092112
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 04:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vhY2nvNwh4GE1c1ziD5DqknFPBAvBF9SUwT9Df1LzcU=; b=BJQ79aaLb6Iz5UHR
	9B3kfL+9IMfut3QZHEsLt6VATM2FOL1nIFybuO7vogwvQw7kTOLEo6imAO82GnrT
	KEMt28gglhkoM7a6oG1Yg0QI1OMjlQ5xH4EwUZ/4IV2vylAPaGTq2oKJQSL4kNEB
	iojOhQyRB+P7ijbZy4x93bNtkArLF9L9dsnaG0hLjDxY5G8l4MFTzK63dcYGOYsx
	Dyvt1duZupcXOcyV1aMPEvhKl99RSfcW/q4XdfOSyyfLHCogXGmu7IqBDBcHIi0i
	A+F6iipwTN4H7MfD27yvuM3AMRTw0L6eW0cf0jbj6kEqhXE4OSDzrxwkY085cbi2
	LI1q+A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk227tde7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 04:23:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2d0c1ead1so5395605ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 21:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776399803; x=1777004603; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vhY2nvNwh4GE1c1ziD5DqknFPBAvBF9SUwT9Df1LzcU=;
        b=dJ22vFhXhzTjwBTqcXIrsAm+s7jh4MSglSmPD7nCkjK3wthtRy3M8+fnRUP0dT1MM2
         BwDFRFqVSP1ANYKes28h7EJKp2GC8tENEFg0FVnC6O2BaCzaf/ykJ/NE9eZgryFppAQX
         BPUP4KiRSvVQBrjXVqeBpGqNPmPPc6TDxHPijWmESroskxooVKJB1chiAXijYheYEH7Z
         k00+q4OVeErrH54pl5NGjcF9q8G8AXDIolWsTm+Zq8LTpM/zGOztozPAVNkfyr1+26s5
         YoEqrOS3absPd7MatbeDXmtgpnskKUxzwEFs4tXDv6ordHHqVxoycnKhBgECWnK3Jlyd
         SD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776399803; x=1777004603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhY2nvNwh4GE1c1ziD5DqknFPBAvBF9SUwT9Df1LzcU=;
        b=W/BzSc9PYUbJc2wQO+vc2PKT1NMdT8ZB2LT7Yd/dJPbsqYKixbRtEyAU76buldmCU+
         uqOQnouLcNxaM3xjzVS0XxUH1UEzFH5m/qhcSACa4raZGeyWWGYz1DiXUKldI7cPOac/
         +BNvQ7FQVBOOB8YFPIKeTSs/HZiKLXgFaLZ8CHpZm6uX7ybedf0Urfnc9AOX0H7g67cd
         UHq9WR0zwtz9l72pcQ7H8Gcrh3eXVfOu7LXP4degm8zNvvo0DzXaw42SGBcUaz5H7J62
         lUtw+2oAh+hhdMB9p+to+6Cxwm1IvTudwSZ/QI/T1xm/m4iUizFca549sWycPhRmEx+H
         /5mw==
X-Forwarded-Encrypted: i=1; AFNElJ/8Y7OhInDwAzsfsKg2TrWsTO/nC+S5ZsxSeZVf657kq7gI2a37/GvbBou0qTj1zTdpcdsxLVyTtXd8U1VJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxTK5HVjQKVAcsvffp8dC+0cdhiXSCWA/llvbgd+zuWftM1Pfku
	2olw8PNSlmLWYiW5CFBOXX8VMLAIQFCG3K/Asq7tfTw8ZfQO+4vEHBFrZvccYjMy36fWyKst/0L
	72xACILYfDtbgI3J9i7YCKWstIjDSRqjYTHpaimgEHBmr37T5NBYh5/vdrKx0By4OvDBr
X-Gm-Gg: AeBDieu6LxdXTxtjlT3kg3goyVqPNAg7WQYsBc7Jdabi4T/Y+qsYa9FZ1w3PPWoeeb+
	aFOijvajIpxo2P5ZRVQ2DME23LiRwWk0eCwJMkFt1C+ESL+M920xILld/CRgBUfFKwgc48qJCaF
	rH5JENaeQWpC3n+zPsT84CWrApAsrxxkYpOsKUSEQjMkSwhrzBn/QDssk0RaP0WWuxHxkMGQsQQ
	A0s7V9vWE9Ei+Xf3+fUTTId6KtYIsIAXmsgRQ3W8htrQ15nKTm2e3DBeRmuovGYvAXhlCcuXFtU
	FB/Qr3H6QJmsqX8/wMqJCRLOUdpFidPjMJyCMuWkpvLUCGsBnQON+jfv5sWvJfNplZR/L1b7y4e
	6Zib63+Z7gHJ6iRZlJc2Rv2lEmB/0DG0VtVzdyMCeXPB2reglpjuTrvduF/5McVs=
X-Received: by 2002:a17:902:8308:b0:2ae:c529:a13f with SMTP id d9443c01a7336-2b5f9eb2249mr8309175ad.14.1776399803371;
        Thu, 16 Apr 2026 21:23:23 -0700 (PDT)
X-Received: by 2002:a17:902:8308:b0:2ae:c529:a13f with SMTP id d9443c01a7336-2b5f9eb2249mr8309025ad.14.1776399802903;
        Thu, 16 Apr 2026 21:23:22 -0700 (PDT)
Received: from [10.92.179.248] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff8d6sm4798705ad.1.2026.04.16.21.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 21:23:22 -0700 (PDT)
Message-ID: <1badc187-1fc0-4eaa-90a2-52e7fa172dc0@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 09:53:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/2] ufs: core: Configure only active lanes during link
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, shawn.lin@rock-chips.com,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, nitin.rawat@oss.qualcomm.com
References: <20260414093135.660725-1-palash.kambar@oss.qualcomm.com>
 <20260414093135.660725-2-palash.kambar@oss.qualcomm.com>
 <i6mbqvrhw2aggbrofp2p6kdhf3jfo4qdmpu72mhhkuqay4i3ua@hcnezixc2vhl>
Content-Language: en-US
From: Palash Kambar <palash.kambar@oss.qualcomm.com>
In-Reply-To: <i6mbqvrhw2aggbrofp2p6kdhf3jfo4qdmpu72mhhkuqay4i3ua@hcnezixc2vhl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA0MCBTYWx0ZWRfX5n16VGnW0Kyt
 0Guib1QxprF6iP/Fk2NoDahxp1eRzMfhKpW7vR97PmCSK7+MaF772ZDBDKBhTILEt6HsOx926lD
 3AhEq4jg8dxf3bmlnr0XAKAU1WAcrDLyVv5/X67yKIwkmA7Trfer+BrY/XCjp839Rs9NdqSKCyM
 VpCNz85Ue6PZPpmBJQLLBZv46bvDuIV4oStIW+LqStV2yO7xMAw8TL8fdCMfK/hi3APa+EI2qCq
 iNU7g2o0nBaXBpoW2uedH05Nkl2Nf9hUwdUq6NGgKk7BAkliBQd1GxptJIo4SKPcIaH1OHKUVkC
 BNTSlDIYFVLTjuNNwguy/rD9SSZBO4oDEBtwE8fjaesDMNJeK8d5SbK6lt4ol6pI7T7Vc5EVnmv
 cdErVf1HsLgEMA2JHmI0i/mx7SRTVY7zG3QoBUyUtIhm8WIXsOgTTfzwDdVCry6loyA1o6g/5rN
 ftykf/Gvzva0Sltg9iA==
X-Proofpoint-ORIG-GUID: pGzSRqZZ-J9UFs1UF7raNT6yceXktleo
X-Proofpoint-GUID: pGzSRqZZ-J9UFs1UF7raNT6yceXktleo
X-Authority-Analysis: v=2.4 cv=Iuoutr/g c=1 sm=1 tr=0 ts=69e1b5bc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Db-oeYxN4i5GQM4S5YAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170040
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103465-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BF521416D5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/16/2026 4:42 PM, Manivannan Sadhasivam wrote:
> On Tue, Apr 14, 2026 at 03:01:34PM +0530, palash.kambar@oss.qualcomm.com wrote:
>> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
>>
>> The number of connected lanes detected during UFS link startup can be
>> fewer than the lanes specified in the device tree. The current driver
>> logic attempts to configure all lanes defined in the device tree,
>> regardless of their actual availability. This mismatch may cause
>> failures during power mode changes.
>>
>> Hence, Add a check during link startup to ensure that only the lanes
>> actually discovered are considered valid. If a mismatch is detected,
>> fail the initialization early, preventing the driver from entering
>> an unsupported configuration that could cause power mode transition
>> failures.
>>
>> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
>> ---
>>  drivers/ufs/core/ufshcd.c | 37 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 37 insertions(+)
>>
>> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
>> index 31950fc51a4c..754bf4df3016 100644
>> --- a/drivers/ufs/core/ufshcd.c
>> +++ b/drivers/ufs/core/ufshcd.c
>> @@ -5035,6 +5035,38 @@ void ufshcd_update_evt_hist(struct ufs_hba *hba, u32 id, u32 val)
>>  }
>>  EXPORT_SYMBOL_GPL(ufshcd_update_evt_hist);
>>  
>> +static int ufshcd_validate_link_params(struct ufs_hba *hba)
>> +{
>> +	int ret;
>> +	int val;
> 
> ret, val
> 
>> +
>> +	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_CONNECTEDTXDATALANES),
>> +			     &val);
>> +	if (ret)
>> +		goto out;
>> +
>> +	if (val != hba->lanes_per_direction) {
>> +		dev_err(hba->dev, "Tx lane mismatch [config,reported] [%d,%d]\n",
>> +			hba->lanes_per_direction, val);
>> +		ret = -ENOLINK;
>> +		goto out;
>> +	}
>> +
>> +	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_CONNECTEDRXDATALANES),
>> +			     &val);
>> +	if (ret)
>> +		goto out;
>> +
>> +	if (val != hba->lanes_per_direction) {
>> +		dev_err(hba->dev, "Rx lane mismatch [config,reported] [%d,%d]\n",
>> +			hba->lanes_per_direction, val);
>> +		ret = -ENOLINK;
> 
> 		goto out;
> 
>> +	}
>> +
> 
> return 0;
> 
>> +out:
>> +	return ret;
>> +}
>> +
>>  /**
>>   * ufshcd_link_startup - Initialize unipro link startup
>>   * @hba: per adapter instance
>> @@ -5108,6 +5140,11 @@ static int ufshcd_link_startup(struct ufs_hba *hba)
>>  			goto out;
>>  	}
>>  
>> +	/* Check successfully detected lanes */
> 
> Drop the comment.

Will update as per suggestion.
Thanks.
> 


