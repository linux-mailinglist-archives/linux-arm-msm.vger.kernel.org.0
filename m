Return-Path: <linux-arm-msm+bounces-107074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDJ5Aff0AmrpywEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 11:37:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F32C251DDE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 11:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 884D1304A4C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 09:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D3E4496910;
	Tue, 12 May 2026 09:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AuIQRVYz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MvSLKmCU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1F72E62A9
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 09:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778578170; cv=none; b=JPOGFGqDE/g2G/4KuwZ9XKWWIxqsag8EarMktYIJ7wRb0/ELWgBZiCZjdN1sAO/qmni+HX2RoLlg2v03qwqQ/FrL+w4LJREeraSeXlVE3csRYbBL9UQl9H7cuPoe6jkRGWPPRSqzO1Z0T4Rx9hyV1sAZpCstsHZVOTiny2SbMTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778578170; c=relaxed/simple;
	bh=zJnQomuSfN7/wfctZ19ldu1++m3nFdjsnCQ/M/br6Uc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=lJ2K8VW1NDkpLCLnaj8uW0mXZczDaFbCMVqk8bLwMT7h1HX1M78gR1RzHH5gYU8dITGJl3CZJuMX1FjWN3vsjlWqyDtM2EXbsDAZVfcjbAaysZ5jyzN1N83xBhn+q5kLCucEJhEIhZseRUYTOnAyLsc80Bxv2+wBQgSV1QLxMAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AuIQRVYz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MvSLKmCU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4vFsN2187915
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 09:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kOfGUA1U+yVoivEW94YksxDQ5Bn1/eVfmM6Ro1Ad+xI=; b=AuIQRVYzgBa37cSi
	hrwPu/fDtmhgDMCWUASpT75lZS6V0hxl+fAtl+2Ca9427IaEtNbzekjDtUwwYaGe
	PoOwj/xnRMpdNjP6ItTTnl1mbyor+T9VEVBokLgCOyQPzn4gZsCdl8vdIQ7T8i89
	VfYfs5xdi5MBih4MfhUtemsUqC/MZs44cPQ7Ephg//fjmhfAqbLR2jmwOIbpBxnY
	1EnUQIdHeXZWK5VkZsIjd6cmB/Ao2Se0PHLLaH42CNc0jOYoqCXz9uZa1FE7Wer5
	KvaqbSsicHScITa2Axo9Q0dWldlaFFCaG8E+rdbDRpJ3cVdyGLg7o2zWLVLEe5Cf
	IpURXw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv2ahgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 09:29:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8f9e55c40a5so283993285a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 02:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778578163; x=1779182963; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kOfGUA1U+yVoivEW94YksxDQ5Bn1/eVfmM6Ro1Ad+xI=;
        b=MvSLKmCU+O7IUCYXb1aYgS9i6EWkfUlDzawqCVgy8tTWyV52a62Dl/3QL3GeHWbsHq
         Jw4xzMDvF51A74XAdVyVfZivFIxycXxH52KSF0bp9jH4KNPVyOGMNWIOFimHFclE5NBD
         WxgEBWZw+wtI2ydkPjj05Jg6wlBlNoqIgVDzAYsIvlAV/wXA6aSGfatkY4fn8ETK5CS+
         uXHzg+1LZJ6wpgNq7vjcESEBAnLbldswVGF3ypSMjBCtz3jN0GGjXfnYUgBwtwJzmVMI
         +8DpOnEOiDKEMv737ZEYgrigRa3UHLrIMthXWbbNJD7PFL37JzN2QcDYVYdhJh2kVPw1
         X/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778578163; x=1779182963;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kOfGUA1U+yVoivEW94YksxDQ5Bn1/eVfmM6Ro1Ad+xI=;
        b=T1iPwbGqa9FgVtetHGq/ubnHu5/z2LeGB0aH68dNd9eYCFp3iSzn+ldR9RZVj2Ekf7
         TlCjlmEneeOHdxiVUdfrqNK12a3dsicVT2mwFVXb+KZETwUdxL8yTbcVEjzxr5RulfGz
         aIfLpPh/xCK6IJEcNSNs/i0mRwNSDB5gQM6PhNv3y5kc+GgIL/hFw2AeHgqjapJvVZOJ
         PGz/zMA7ACiD/rFZAjy9yASHtyuRw0ED/xWrh7hKJfwpGbaNqTp6qD0rUl6nnDL/Oo0m
         cbOZlfdMAgtp8jFnN+07toV5lgsa4nlU6zCewuoBgkGzZsfo+ajBnscS0GWGQ9grF9Mp
         CBzw==
X-Forwarded-Encrypted: i=1; AFNElJ8pN4uBNsS304/n4FuPMXWve/IzgCY3FK72f7L26fapAW6gtmq/XON5qBmgYUoMQM/OaPC2XYQumcA6dp8V@vger.kernel.org
X-Gm-Message-State: AOJu0YyvvTR/TW2z15NslJNariotzXodcxRPPREggV+LgtJbRya1Ufjj
	rpJs3ylv0txHnNZLY1QxrDbJ7lMPeY5WQNCf0yEmKNZ0ZqN+Y6+dSYobx+cWdVM0RCrKtoPwf1G
	FCfqwyy+y3YfD1Jgw/gzhAZY6lx37YefWVTxOCraaSfanIJd7UbrQmODO02/fLZO71E4m
X-Gm-Gg: Acq92OHfJpS3hfgwZKS16EjwCAT95dXp/1Iz6fyeurAMHhi1gXHajXRKDDki1bgt529
	0Huc6U99Sr1FdbwzQ7JTHzSAJ5LJcKBLwnPYNQyOP1omijVvoWPLOmrITygAossCI1BCv+jIXXj
	QhjobH2jBq3oavnbcgoFSCGGDUoxu8s+XOtXZJ3IiC6+Zfy7SWY8yFj5fGP4uJByPAsF5LxrLPD
	D2tC3NNE3D7c3bzzLd8JiOP8UBOX68kKKEO+QldgHYLf04R9xZzuDSjJdSa5nL8P5Akx0Ey+H06
	2Itq+p1+UwCznpAmMxLY/C4upDM12ZG479DAhde4iknWLjL9lz1ijeTmBXBRjIWJWx+2/4f23Pt
	Ubg2yPsL97bO4v9PH58rxa067UFsoNeI+YBp8RInUZ7DVfrjoiPWtWMZgCRtD+I4bDZBHL/n8dB
	0dyMzwGGNy
X-Received: by 2002:a05:622a:12:b0:50d:9e36:f961 with SMTP id d75a77b69052e-51461c26170mr378830171cf.20.1778578163434;
        Tue, 12 May 2026 02:29:23 -0700 (PDT)
X-Received: by 2002:a05:622a:12:b0:50d:9e36:f961 with SMTP id d75a77b69052e-51461c26170mr378829841cf.20.1778578162962;
        Tue, 12 May 2026 02:29:22 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e906a0615sm30214385e9.2.2026.05.12.02.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 02:29:22 -0700 (PDT)
Message-ID: <eab8dcf5-080e-45c2-985c-b0711185bed9@oss.qualcomm.com>
Date: Tue, 12 May 2026 11:29:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] thermal: qcom: tsens: atomic temperature read with
 hardware-guided retries
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
References: <20260511071024.3130247-1-priyansh.jain@oss.qualcomm.com>
 <06073a6c-1f75-4dad-9309-9bc47a2b4708@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <06073a6c-1f75-4dad-9309-9bc47a2b4708@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ADOKiYJz9C7Mk4Iaj2UcqCdgUiXTqwkf
X-Authority-Analysis: v=2.4 cv=CeM4Irrl c=1 sm=1 tr=0 ts=6a02f2f4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=FdPw2Um4bHU1Oq3-VtwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA5NSBTYWx0ZWRfXwFnxFucGGwL7
 ismK8f3NzsKicX/RmO9DG6bQPB7zrZWZulxqIgxoj40nfl2WIWmDjnaEtIssSvo1E4hS+lQgr+t
 65ftBC9gdUEBr/TIvliVgfAguN8OKdlN5lafdci/AVUSuuhzZMRN7FPMRk7RYL6s9OBHj6P2+67
 C++0d3MwclTcj97UMLve9bp9w20KX57oVQCM8UzG7beQ88PqhjD5wuTpzbnXlO+KzKAv9x87z8q
 DLpivscXxoMoKderkjfIrH9QtMD62O+lgaqGeiXC1nJLGhL9zNV/VgBGuVMYTJkiF5UyyMZnnYY
 JsEbm7AGwMWz3u2nEfC2F0f9GOAKExK7/9F99Hz7GUOvC64DS5STr6Pp7Uc+8yk1WyAwtIwafx3
 1lx7Vv8SDr8r+0wtVihIXP/peq6BmBBHYCR4ljXQjFrHHJoRdtOihivMsBoFPpxG7oDsrmHmLWu
 2CDQHkwZZaBX7yI+Ocg==
X-Proofpoint-GUID: ADOKiYJz9C7Mk4Iaj2UcqCdgUiXTqwkf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120095
X-Rspamd-Queue-Id: F32C251DDE9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-107074-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/12/26 11:19, Daniel Lezcano wrote:

[ ... ]

>> Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
>> ---
> 
> Applied, thanks

and dropped because of:


drivers/thermal/qcom/tsens.c:819:9: error: this ‘if’ clause does not 
guard... [-Werror=misleading-indentation]
   819 |         if (!ret)
       |         ^~
/home/dlezcano/Work/src/linux/thermal/drivers/thermal/qcom/tsens.c:822:17: 
note: ...this statement, but the latter is misleadingly indented as if 
it were guarded by the  if’
   822 |                 return ret;
       |                 ^~~~~~
cc1: all warnings being treated as errors

Please next time test your changes before sending

Thanks

