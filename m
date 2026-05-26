Return-Path: <linux-arm-msm+bounces-109910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEqfCC/eFWrTdQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:53:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 995B85DAFB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 570BD3010EC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A49142189B;
	Tue, 26 May 2026 17:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7bV99En";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W/P+wPj/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1D5421880
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817970; cv=none; b=tFP4DBRKfrq+UFHRMzjh2qbtbF+/MUG7HvLUCe4OsxBdKabCgmbuV/ugc29XxBG7RIU+k8DZEsGtSXIo1J+4C1jeto811LwOj2HAsp50xBNAWlgT8y8TkBhmHBoVq0gLn90zwabsczzuxNp/Wr9mPUADQDChvc/DvehcvFEhDew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817970; c=relaxed/simple;
	bh=Vr6M/PwxqfP52iaG2RuK/Nwr3+InnOK0QJf/jYsPnVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NgVLjz8FliewXHL0Acs9Wasj5UXQ58HOU9haNHn3HGHxgGSGz7JqCdXNGiJCF0OxHtnnGlJmsLXlP4ArIq9d0jWe2/BuRg/uf8v8w6hrk36D9t089FtIvRFnSE61ugDMHxDbxRDc8ViJXdPglpRFd7uZXY3f1oMMFiJoyXsnWps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7bV99En; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/P+wPj/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH1E672995632
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	US0EdpJwtoJcfj15vVP6RzBks/B4cqT0GUxzgW/jCag=; b=N7bV99Enr2pc/HI8
	RjnkVv1H99R7w6/8YV5G1TJj2YxwymB8GVfAd+VxCXsfmN7MLv/r3k9cg6SYxy7q
	cafj7HQB430NDrAY//IH4YePDQpwB9aqWu801huRAhD6jxE44rz5aE3SJ/+40w51
	uLNx2DOx6mpvysUSsPBA1r+94JhA7h0648UuAbefGysxOXrmR8ItykeuoruSqsxL
	UKk4mE7RlOaznS0d77TNEN+bkMnbZdNdkobTT5Bdh1btCgt6n/Nya5SOO5kDSzop
	NQmyslyv7CV7bqHARytX4yTOZ6xVGT8y5BhAOlRwc22KHY1Q4Z5HT41TGGlM3/mX
	NtWNIw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edcnns53u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:52:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4654f9bb6so118834845ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779817968; x=1780422768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=US0EdpJwtoJcfj15vVP6RzBks/B4cqT0GUxzgW/jCag=;
        b=W/P+wPj/eardIa26S8VZUbfBTS/IFfQB4+X3qqMz9eeQTsn2qQlrqhpbJPN59OLDc2
         3HmlcpNX0WcrNwByDvFUIw36WuVVKjUGX/F8RnqP9H55k6OGIRjhfa04Jnj0RwCWsFcY
         4K7Jf3VwllciZ0Z/eQdaNvMOo+o7ImtIHVxE3mAuwWu6ILivkDNVHBs9kg8KnbHCNJzo
         y7tjaTgMAOnXBfxiTjsspBXFj0NZkXhcYj3ZssUm5695P1+ViWM+WYdXCrH+gFrYIwFV
         YVGl/7i8jB32mT0RUwRkktn2FtrumSZ2epuSVFKzrkWSJIIhyMPNXx+aRL6wtO1nzhZj
         wQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779817968; x=1780422768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=US0EdpJwtoJcfj15vVP6RzBks/B4cqT0GUxzgW/jCag=;
        b=sAmBnaU29J7bXDwRpVdZkgWOU27QxfBG+5J6oyzssK+MqFpCAsf0lA4A1Fvci9aRtn
         w1/jk6YvEgSnLD93W4AEZ3NYoRRIhbokeoK0q0P/RuHYu3F9pUX5c/mA8F8Tgj1syjPp
         iHWgR1DcirOpnx4eMv8bXoX16LbNMPv3xmTmOWlcS596bYWFeSZDgA+7bt3dqhOuqeO6
         NSvYD+BqpdLgJ9ceMNuq+PVuEdwP/O4UXaqE646vZh9CUVJ1N7jh/TWzkfbyzuLjzsKI
         Oux/PvMTjd4RNWG2USbIt4N3ig7qwP4ggKKWcHzx+ThZaqTvpwfM+sBKeuzE/deZSAMC
         438Q==
X-Gm-Message-State: AOJu0YwPLfAOfT6RWA2TjRB8vz9jqeE8Grwhjo4xROJ/hHasjLxvCg8I
	Y6LrXyUx7VR2Z04o2+ao9OUykQ/tmyDQITq0PbXfEESHNKVmwxnbSr8PJpfqyr/pxppuBkvLKA5
	dpw3AAGijDdqZIWXGOeXD1/9pJMQ41eED/ythaYxiCi715QMhkmvVLf3o8KnPVx7cK49v
X-Gm-Gg: Acq92OFPahpzQiRNc4yAUlEgrtfO2K09B9X/R074DylSCbmAl6DlRrL9TnuQ3BGbroT
	npmJb3iTrmEKCoO4A0pyT03w90vT/X52UfYGqZa524lqlZnqASuA+Fn0AQ4SwXEGxMoacTD+gNR
	fNhqtREQvjI3HWLFkL0Nu/SGr+BHoI1GI8pyI2WUcO1zmyzuW5M5nR8gl15ex3oKQUh5XeZxVAh
	yEtyXIX+kP8V7/lPzyuXqMeJ4DTYhmAY8A9upBjdlkzyo6X3MXYXPHEjuSbw09r8GsxBAG1PPF3
	SGfL85u6KQNy9RRtvo118LCNtOaNEqmkgcRWqs2nCjeDViV4Il+ppL2ufv6EFDhLHqrxIA/Ek29
	D4GxCVMHeDyXKbQqLG0PFYKT/tD1raTr4C8MXC4kheqFophkzko5e
X-Received: by 2002:a17:903:1b10:b0:2b2:4d36:7ba with SMTP id d9443c01a7336-2beb058078cmr196462435ad.0.1779817967595;
        Tue, 26 May 2026 10:52:47 -0700 (PDT)
X-Received: by 2002:a17:903:1b10:b0:2b2:4d36:7ba with SMTP id d9443c01a7336-2beb058078cmr196462025ad.0.1779817967002;
        Tue, 26 May 2026 10:52:47 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.233.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58d9fe9sm127139065ad.65.2026.05.26.10.52.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 10:52:46 -0700 (PDT)
Message-ID: <e03d1626-0220-46a5-af0b-dc149beeed30@oss.qualcomm.com>
Date: Tue, 26 May 2026 23:22:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: Document SCM on Shikra
 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260501-shikra-scm-binding-v1-1-93d7faf1b784@oss.qualcomm.com>
 <60dc7a9e-3ee8-4419-a53f-dd6c746f9276@kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <60dc7a9e-3ee8-4419-a53f-dd6c746f9276@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iyn1UT6GKT9E8syHLdynls_FJ97wU5Oj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE1NiBTYWx0ZWRfX8Zpi5CvSknnT
 2leBJN1xk8OE4JA44Rk/LBiwlyKkHRQW4Z/qppdvAWiiNAkfm4rMjVShyxpX4s4x/oPuwIhasT7
 csKOPwHHeFaBD4tSY/HMjKyp8uDWJ3xY0BI0ESCH8QCn4SRPzlXNMaRXCQ+mOso6SLovd4f/ZDg
 M00etc2wn0/o0YHOCt1AW6PLfj7vUrqt51vte91WA7RVoR/Nt+uM5zhDan0VEmxo/aCFcQIIlCM
 BU4yub7kcF0KdsPwrEEBn+eY/mfSxPWJoCIsFgNHdUL/w+maMfA3QBsPErIzWAxkgHHTKEFVsiP
 K9vcc+04VlcKXlXUyBfVDudlFvSkA4PbpWLAyP/HbWaqS6FhMLAEBE4KZnmwcKA9Mvbvsl7JVp0
 9ErFcK//kRf0q21viKvtZd5Xbqq45vdtH4buWflMpVAr9KGa/iqGozwl29OrKnM2rrsZIiz+6AS
 uXi3h1moYo4/hylAIug==
X-Authority-Analysis: v=2.4 cv=VPHtWdPX c=1 sm=1 tr=0 ts=6a15ddf0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xYyWL/Q2DZNEK6BS9gpG/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=IVn5nGlCpDZ5uCHmXRgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: iyn1UT6GKT9E8syHLdynls_FJ97wU5Oj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260156
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	TAGGED_FROM(0.00)[bounces-109910-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 995B85DAFB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/14/2026 9:21 PM, Krzysztof Kozlowski wrote:
> On 01/05/2026 19:53, Komal Bajaj wrote:
>> Document the SCM compatible for the Shikra SoC.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Gentle ping — patches have Reviewed-by.

Thanks
Komal

