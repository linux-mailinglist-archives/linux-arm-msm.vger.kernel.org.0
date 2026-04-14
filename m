Return-Path: <linux-arm-msm+bounces-103043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFp0JEnM3WlGjQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 07:10:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E97C43F5B2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 07:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CCC93006173
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 05:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F50282F3D;
	Tue, 14 Apr 2026 05:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctu95rg2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YLxS7+U+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71886F2F2
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 05:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776143308; cv=none; b=ri6dlZY7B+oUEtnA5nIYSFByueG4Zh5Ly/RiBixMLe03H2opJc3fC9Y7ra15NPVrVnEvebzkw/mARZq58iSrV9bWQYec/nhRrlDeppquR91m4tDaISXVba6f3/a3SVwIFXrgFBeblqoPyEUlhB40No6aw0jLfejTyWaSk9+Tu2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776143308; c=relaxed/simple;
	bh=lI71pR7b1UtY+HJX/qJKan+BvKisGJTcDsTu9l2I034=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aU6TZY3NZWuw28unwtjQ6MCKXA6ZKFNCri8y2dpacfUvz1EZ8c982PysR31gfMwDmaxuiJ0FkxDfPAFQvK5hGv+ADtaE9X4w2DOaH/gxzSPrsxd5X4HZiuhGLUlb0Xl9jNTB5aYpKtUXsy5mjQoPa4Tbg1j8cZUND+0WIzchUjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ctu95rg2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YLxS7+U+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCd893505300
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 05:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fend+ODuKiVJMX0bQ/3KqhrC40puAzg7wd7+IABXEz4=; b=ctu95rg2oTUEsUgL
	Ydvj+yBEuZBteguOdTX1WmL9U/ZkXJaXdvKGocIODuY+XIDgkHkthkgllg1aOpQO
	OXv35QY/+GOGGAcd0lPaHHnsbHIlQ2XPrNtUwxK7fPJnPpq4Bbjp/mnAq5LgqNpm
	Yq8UZ8s/5yk6DWRr7wIgEtfD38FGfhhvbmnEEOIESI+rsDD1egOCzRj+Z3A5w3we
	ZdxyD6XbteYim90U95MQ1bnaxPt+6Bo9uuxFJqUZfzZ2Z5MckgJnNA41zgDyv6bV
	//63wVZTCm4osJyNWc5A4F53SBxkE4YrfIQkkOhB7MH6p1HJnnDHUIqkYHPzoNFw
	fYldZg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870h3b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 05:08:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f32d67ba7so1087924b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 22:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776143305; x=1776748105; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fend+ODuKiVJMX0bQ/3KqhrC40puAzg7wd7+IABXEz4=;
        b=YLxS7+U+RuB6n7izTDyjiNj5q24so/F2HT3YmzY49d39bkr7WQZNEm0Rt46juHgHwu
         EXKlw5iu0UG9OQPiTbV2RQCL8zuiIqJu/fHWAzN+UPSa7DF/m4vMqyq2I/RkhvTV7Jng
         d36/feD9Ih+nn4ITe/CDDevTEtjmYvEvXFoUdKuhPdkcaRn4kN1om43oVx2IPuWyw7/1
         tq66KR+r03359TSgdGGTz6bIp92TjTJjKmjMUV0d6Pxm6hVNYETqd7qhwqCPKNJBkTJc
         xJQ953A56mKtnH5DUTJ4244IZusW8lYU8t0ABN4ubkJ2CKo3DehXWFJlSLiuK6jL5eXn
         NRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776143305; x=1776748105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fend+ODuKiVJMX0bQ/3KqhrC40puAzg7wd7+IABXEz4=;
        b=ZZpPLy0kpA/f0t8fpYoqseDcjnpT7tNGho4atdGh6HJ1U8RjBP9RyOMkZEfgXjCiuC
         C6Aangl/aCTtsdloGR5qgrxtGvPtXSd/JPlbplcymfVTH1bWwQvoxxmPJvKsSUOz8jrB
         CvT0Ht0EuKwnbiEc6UZpSuPqgUSCR3UO5uAwdb0S6Xk+x5G3o1y52+eIajA1DWDdxoGP
         dd877OOEpCSOGM9yXgMPmM4oPL2KnF8BWfoQw286r9CzwxxdwMXXcZ8pTAk0hOFMK9x7
         NMqbBQepOegkcGJFh5b4uxsGNWQpcMEPDC0tnqcjGSfAt0njA6vNNLUaI6iDIhQD9pTN
         M44w==
X-Forwarded-Encrypted: i=1; AFNElJ/ZuA5UTpQmJ5XHLhi3uFKEYmSyF+zHhGuXKPjNpfnx5qFfbO3rPqWLbj1wcKmnFwyY1C7oa39jzqT4pclY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5yE7ufAuZwS1MFqh7hi+QTta9DtAaLtA713JkVJw7VqYHSUET
	OkUL6PgQXaJL5nAsG7s7SJeCRbtDGxynHuh6vNEvNLexhDGYZ7NZ1MyDMOE98kmKfJdwETryftX
	0tB/tzeaf4rGByiANgPxjlIQGUI0AMk2QEuCl1WxxA+q2gDBjjL92UquFEoathWerATq9
X-Gm-Gg: AeBDietnQ5SzuPVLWGD2NNE9W2qcTFBZmhG8Bc89CcDivYnw0K3AQ6Ryo49QEEh93eP
	0ScTktiXGRM4zmUFmjt5ID+De64+1g5bEgFle86/4gRo+fy6bICdXdz3kmkIdomOXtVzWNj4taW
	jSnRd6CpMsnyFft7DLZIKBxR5bCRDz1OgwRr27mKKkpYJxIx45vwtuSgoJmv0MeCRHVd/fAxE9o
	pFX+eOg6gXTRIyTyPhj4iJP+PCDAYaBCI0IEP5BtqFwZm+TAvc6NqgJx5FxWHKTMclTs+Nv29mR
	oeTxLlsC/c7H6P6/TLBgjgPkIAr0llvC3m5K8XrCIjT3v++c+BywQXjtnTxTiqyJTRYlqETZuL5
	9xybkuatfySygHm24Lt65vbQPPZNoYz0HB7CgZJex2kP548DbWUcwQnsmZhU2xTr8NttzWpIPEi
	ovFbvyeUP525DfhJM=
X-Received: by 2002:a05:6a00:808c:b0:829:6f7d:3093 with SMTP id d2e1a72fcca58-82f0c27862bmr14821294b3a.48.1776143305308;
        Mon, 13 Apr 2026 22:08:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:808c:b0:829:6f7d:3093 with SMTP id d2e1a72fcca58-82f0c27862bmr14821264b3a.48.1776143304792;
        Mon, 13 Apr 2026 22:08:24 -0700 (PDT)
Received: from [10.133.33.94] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c371825sm12754570b3a.25.2026.04.13.22.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 22:08:24 -0700 (PDT)
Message-ID: <4aa94982-bcae-4335-b70d-4b0b4cdd697b@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 13:08:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
References: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
 <20260409-knp-soccp-v5-4-805a492124da@oss.qualcomm.com>
 <ca268d5a-f55b-4f6f-ad35-1f856446c261@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <ca268d5a-f55b-4f6f-ad35-1f856446c261@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NiBTYWx0ZWRfX79Dx6NcFrhMt
 IYWjawMpgXzqHgoxIwqHCPiLV8Lx6/0Z2xoM5ms5O67l84Tih4E1PlO+WYnq6MD70shZaM6Fh44
 wqeU24YvX7zuUJ3XEYCsWkeVqdC1YlNTe9mG8BFPnTs2oO5fjCbLBCiW2Zh93RcxVYlEO71gulP
 sxKF8gUVqjHqqqQKQK+4OrE6oBiiMaK6R1ezANgMQAqC/OEpUaTGCbc3B9GckDr3yEkr26UjkL1
 1s23NasJsH1gjKOVvVNBhJjrIPLdvpDBDivj3rwTX7CsDNyHxCMT9TVZdSQSIe8SMvIE+7Md3Kn
 7EWApxcjGqJ3VdgNIxk4U9pAPdFtncE2GwOB8XzVf2cNUIdQ1psyBm8JpdqnWR8lejvCFbwPNSn
 XkYcgq4vt53AwiNcvtxrtVtqlfkugJ3tVUUojBKYnNxxZs4nRxoMQMCch9AJ9oy9e/Y78qYey1N
 /gjAbJCp00aV1qM2btQ==
X-Proofpoint-ORIG-GUID: UlFd495BTaXrYUh4S-4PpY3-WdQk_I2-
X-Proofpoint-GUID: UlFd495BTaXrYUh4S-4PpY3-WdQk_I2-
X-Authority-Analysis: v=2.4 cv=btZ8wkai c=1 sm=1 tr=0 ts=69ddcbca cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=OYuZKRwE9jNIGw8p0IgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140046
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103043-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E97C43F5B2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/11/2026 2:04 PM, Jie Gan wrote:
> 
> 
> On 4/9/2026 4:52 PM, Jingyi Wang wrote:
<...>
>>   static const struct rproc_ops qcom_pas_ops = {
>>       .unprepare = qcom_pas_unprepare,
>>       .start = qcom_pas_start,
>> @@ -518,6 +582,7 @@ static const struct rproc_ops qcom_pas_ops = {
>>       .parse_fw = qcom_pas_parse_firmware,
>>       .load = qcom_pas_load,
>>       .panic = qcom_pas_panic,
>> +    .attach = qcom_pas_attach,
> 
> Possible issue in the future here. The kaanapali_soccp_resource does not set minidump_id, so this is not triggered today, but it is a latent bug for any future device that sets both early_boot and minidump_id.
> 
> qcom_pas_attach is added to qcom_pas_ops but not to qcom_pas_minidump_ops. When a device with minidump_id set uses the minidump ops table, the .attach pointer is NULL. rproc_attach_device() checks if (rproc->ops->attach) before calling it, so the attach callback is silently skipped. For a device with early_boot = true and minidump_id != 0, the state is set to RPROC_DETACHED in probe, but the attach logic (crash check, ready check, ping) is never executed, leaving the subsystem in an inconsistent state.
> 
> Thanks,
> Jie
> 

ACK, we can add qcom_pas_attach to minidumps_ops in next version.

Thanks,
Jingyi

>>   };
>>   static const struct rproc_ops qcom_pas_minidump_ops = {
>> @@ -855,6 +920,15 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>       pas->pas_ctx->use_tzmem = rproc->has_iommu;
>>       pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
>> +
>> +    if (desc->early_boot) {
>> +        ret = qcom_q6v5_ping_subsystem_init(&pas->q6v5, pdev);
>> +        if (ret)
>> +            dev_warn(&pdev->dev, "Falling back to firmware load\n");
>> +        else
>> +            pas->rproc->state = RPROC_DETACHED;
>> +    }
>> +
>>       ret = rproc_add(rproc);
>>       if (ret)
>>           goto remove_ssr_sysmon;
>>
> 


