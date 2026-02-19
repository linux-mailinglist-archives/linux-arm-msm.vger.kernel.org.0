Return-Path: <linux-arm-msm+bounces-93414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAwRETAll2nivAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 15:58:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFD215FDF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 15:58:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80B1C3013017
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68979341678;
	Thu, 19 Feb 2026 14:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICuGd9uK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q3gKEg7h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF52B33F8C4
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771513130; cv=none; b=GzClqcOifgsS26rSXppqTsQOzjJBrHkLGP9vDC2RJXTB00m4tWTveNrDS/ElkIcINdESZhhTH+lKPMDShre9xFvOzY3Uet87mFOB9RaXAF1MPqTvx92eUMtwmhT6XQiiIiqpAvD5ODkFC+qAUrO4mU9kAU9HWl+iWHmqhxU/cb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771513130; c=relaxed/simple;
	bh=XSqg71SAS4s2Mq71PZrvscXdeTD26R0DGY1v33l3erU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NF3GG4xY3SO335Xz99EgyW/ovh0N5BfterS3DSmxeLJQTaqu/xPnJHq9sQZrHdT5XMV5LY5o+VUCFNxslSKEzMwhXlCiK3QuPeuLNDciCZIZ/hTgF3mtMi2oPgADKZSzyFIUZ63cfAqvhPvalG8hguLzxGV69pI5MTqxv3INxwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICuGd9uK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q3gKEg7h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JEcPvw3319792
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BZMRtc+BiF/gI74TfCZJc35g7vW2H2eXsMdnM71fw60=; b=ICuGd9uKb8AsrBJw
	XLuYJN/+IVf3a6FIm8IYbwfjCnWOjoV4kvpIiWgJgYG8NBv0Pl1qc86DmBLle4dE
	kV8lrhcvZ/d3XFq80UxrFTB4T84QjP7SgkiCMrvDPL5BOY+gR0KZbYLEKIcNvPES
	BVDclVv2d9eRugvLvp1yRPrc4kycDTbra1nuFgGjTAhU3vu4b2dplK4c89YROMZz
	jMCaeHGaoG20Thg8/N51bBijsrREhWkcwBMwASUmacYqjurLEqzrr/Xe51lQtmxz
	yvhzIZiq9pFzl1KAHsvFQe1gx+s/IzQpdtRoUyZd3VzijQJf6r+F/X4CSrQYYXmB
	0PD+1Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdv389gv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:58:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35658758045so729156a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771513126; x=1772117926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BZMRtc+BiF/gI74TfCZJc35g7vW2H2eXsMdnM71fw60=;
        b=Q3gKEg7hbb9BE2tS8kPwJWYasPswYS/57USoCSCDoYlaJj2KJkLThCOstVEg9DK3Cu
         V8MtLlEh4sZIAyzAmXvD3CSnS/fq7yMnggPCc6nU9GPAC0CRX2u7y1jAh/yyzBWo/w1/
         UIDJnOZKLi5o6dQEwhySPLNnfrlTp7vE0bB5ytP291hamXpSKKh6FdGjxIpD3dktJbpD
         Rtlq0/HFw9mZMN/8MYRtIjqgSyL1YTi+BxLBaZ8ij34c3wvg3TRBzC04prPxWsJ8wh5s
         XNzoMchVD2H2TdK7wUhzNvRQku2dEHa8N1L7qF7JQOlJ8FNGQClmlv8oojfX05yMRm7V
         0CYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771513126; x=1772117926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZMRtc+BiF/gI74TfCZJc35g7vW2H2eXsMdnM71fw60=;
        b=qy6nxXZK6pPBWAvU6YoCpY14LuTojFXb0GtS+rEoPV0GmsupeQ060R7VF/wp5HZ46L
         aU5TqWLM3W4KCT3BwTMPq4mjcl5EsP3yDd064d6RG6JuvzkT+vElziHedag3qo3CA7g4
         Lp+aX+HW6VlZgAfT+DbvLZmYQ0Qg8+yxdPdqiR74NiAEbWidkST0BZC+gPYBr2nv8KgR
         xycfHPmbvDNH1LsbnHu3uAy2V1QtAbvm27RNCIhU7IwVOkTafpqQTcXnaXFARhIFtMbA
         D2r4uMMnIGNxTvqCbn1tlfaqACU/iwk5iqwD6+NHHVQyU5upsoFXbmajXvdoMC5rsfTt
         TrqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOArf2lE6pTyCvRhBMRqiOFtDCeIk7LIqLEReIooneX1zQ+ed3isOYNyulifxKpB+Eoi2RjIQQhcTGmDPC@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq+KkfHIyccdgYQOlJEBXNURZjiTUkIEES+tvi6IExMI/EGBWB
	d36K+5nE/ZJBycSu4zK1b5fi/xQttTh0z1hNW/cZlqFEdFVYL5NfrePYCGkLC+wXYxbq4plYl+h
	gEPsXRcncn5dYUKDqFM3ovZDNEYLWc3ml3yGeJ0iPLptxo6fU9oe1Yj71RKyjtTHoPxku
X-Gm-Gg: AZuq6aI3Io3MV/M87iBOmMaBX14Rtfc9msCp5rjQ1g5mWbwWcoZ1YQwCh+TyC4rUSKi
	8dnMdvQbVNV15tWCVDb+j9jizJ/6AS8zoqnspiW+ZF0L1xKpjp6emW9wB1+39y5P8UuWj4D7q2r
	mv5a8SGR1Dy6rwNkT+AP7z1XLs7V7KYaAF0CGX3wz9CHWeknIuHZbnrZS9+BmzsDjraUa2knSco
	FnyuWMRCccmTKF3TJvlK++IahjKwvCmf699IfQH4o1hMxJiFGSyiluCQKq8c5kOUxTePgOQdRAj
	8q7wrDbzIb2kNI3zD9l6EgeetU5UpbsY4+Xbadtg4Wv/d6pYe8RR72P8ud8F03IdFZU7NLWh4uu
	o9/fYQuNj9+9AOq0RleV0ezXrj3lqNPhUSl4yy9kT985Bd6SwHq5uVw==
X-Received: by 2002:a17:90b:274c:b0:343:c3d1:8b9b with SMTP id 98e67ed59e1d1-35844f85b15mr15779195a91.19.1771513126572;
        Thu, 19 Feb 2026 06:58:46 -0800 (PST)
X-Received: by 2002:a17:90b:274c:b0:343:c3d1:8b9b with SMTP id 98e67ed59e1d1-35844f85b15mr15779151a91.19.1771513126008;
        Thu, 19 Feb 2026 06:58:46 -0800 (PST)
Received: from [192.168.1.6] ([49.204.108.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358970484aesm1301630a91.4.2026.02.19.06.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 06:58:45 -0800 (PST)
Message-ID: <6acfbc33-cdeb-44ce-8f80-90dc18573464@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 20:28:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/13] soc: qcom: geni-se: Introduce helper API for
 attaching power domains
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, chiluka.harish@oss.qualcomm.com
References: <20260206174112.4149893-1-praveen.talari@oss.qualcomm.com>
 <20260206174112.4149893-7-praveen.talari@oss.qualcomm.com>
 <119f619e-9f3d-4c21-8cf1-a8b4e1024ed2@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <119f619e-9f3d-4c21-8cf1-a8b4e1024ed2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ceffb3DM c=1 sm=1 tr=0 ts=69972527 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=SEi2w9hYDuVaAARFuk79KQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=RFm3ULBN9CpRR-2xPD0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 8Xul__aIce1x6UaindeWSBD17HIyUmQ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEzNiBTYWx0ZWRfX1wIgpmdjOmwo
 4+LvYl+zpZiCgEK5v0IsMZWV+3CSXXdq2JRkcl9vr+KyygCbz8ojqliNDJXCO6dXN+AJUrvlDkg
 lbSxcJ+8+wdVxJka6B6OaFOgpjH6T5vKoePnhfXDu8EatYoh2dkxfXdVuV+MuoB/Gvred64qLzN
 O55iMU27V02sP2GDE4h0IGGAMSsNDqvqzjSYd7kcJX22o2BrrKOKL6fqaHvIyDYPwGiDTfQ44qp
 oeD8YcJ/oD+3j6FDEg9IROrvdE5J5R3RGO0nyOcKHf5XKmGjYJGtxpkceSaQ53sfj8Buj2VN+iF
 IgBp4lhzLFJ/+4Ai9+Ex0DeMCvriiOz7Bo9tbhJt3/e+6LXaJr7hFGSUEN+6LMpk2XNhZh/C9ZL
 /HnEBnUF0JXo2mZTSJhQd9474Rw+tvSr5P95DUhmSeff3poQuIgcyI02+criq3EjjPpiZGzds+W
 TlIDw6vRpuP7uejbpxA==
X-Proofpoint-ORIG-GUID: 8Xul__aIce1x6UaindeWSBD17HIyUmQ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602190136
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-93414-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EDFD215FDF0
X-Rspamd-Action: no action

Hi

On 2/17/2026 5:09 PM, Konrad Dybcio wrote:
> On 2/6/26 6:41 PM, Praveen Talari wrote:
>> The GENI Serial Engine drivers (I2C, SPI, and SERIAL) currently handle
>> the attachment of power domains. This often leads to duplicated code
>> logic across different driver probe functions.
>>
>> Introduce a new helper API, geni_se_domain_attach(), to centralize
>> the logic for attaching "power" and "perf" domains to the GENI SE
>> device.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +int geni_se_domain_attach(struct geni_se *se)
>> +{
>> +	struct dev_pm_domain_attach_data pd_data = {
>> +		.pd_flags = PD_FLAG_DEV_LINK_ON,
>> +		.pd_names = (const char*[]) { "power", "perf" },
>> +		.num_pd_names = 2,
>> +	};
>> +	int ret;
>> +
>> +	ret = devm_pm_domain_attach_list(se->dev,
>> +					 &pd_data, &se->pd_list);
>> +	if (ret <= 0)
>> +		return -EINVAL;
> 
> I think we should preserve the original retval for the < 0 cases
> 
> For == 0, this can mean a number of different things.. but in this
> specific case (where we always set pd_data.num_pd_names == 2) it seems
> that it would only be an issue if dev->of_node == NULL, at which point
> this function would have never been called

I hope the below is acceptable.

+int geni_se_domain_attach(struct geni_se *se)
+{
+       struct dev_pm_domain_attach_data pd_data = {
+               .pd_flags = PD_FLAG_DEV_LINK_ON,
+               .pd_names = (const char*[]) { "power", "perf" },
+               .num_pd_names = 2,
+       };
+       int ret;
+
+       ret = devm_pm_domain_attach_list(se->dev,
+                                        &pd_data, &se->pd_list);
+       if (ret == 0)
+               return -ENODEV;
+       else if (ret < 0)
+               return ret;
+
+       return 0;
+}

Thanks,
Praveen Talari
> 
> Konrad


