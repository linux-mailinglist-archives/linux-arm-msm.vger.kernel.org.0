Return-Path: <linux-arm-msm+bounces-91264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOZPMVqGfGmbNgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:22:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C056B94AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:22:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99001300BDB4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE4835CBA9;
	Fri, 30 Jan 2026 10:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lIHdHt0u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P5I3qjNh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707A435C195
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769768535; cv=none; b=NcfoCboTh7QNGJ3HTpwBAReIzTMzklG/RxgYG6DR7ZLiyjeAWB5YDZvrfQ3kYGXR70BCm5B1uqz532dGOsQweTlIZHnICA+OheDrJ1W528iAJEB0UMoZqUH1pd2o5Lku+qydz+alUyclyPI7VdqxvJGfkOUm5DL/VnrJqh71yC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769768535; c=relaxed/simple;
	bh=ztPKY6XHM3k4XQpFpIWxSk64jJzvQPmSjuIlXhvrPdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CrEw2iILGhBU2XKMvmTl3G9Yxp5DtRNwnwzF8TnCtpGESLMq+3jnqrxOqcuEZuy8/VplFZBKqAeryvsHSlTnjgJ0SjVc6ubnqieWLs9xPzHADjjAwrNxwC+j8P4IXacboSkSKmCexF2RO8WSeHhPp+Cr9MF20qg/kDl1V9sgGZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lIHdHt0u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P5I3qjNh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U4bZ821485466
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IhwTqwGQwCpOE8eWbIm7gM76YBPrk4H8irWBzrqY4UY=; b=lIHdHt0uJdrM80OB
	b1TJkjQbFhYQebFv3zSrp6+FshK11m0WtJEmvnwHnBKCX5+1+qFyk/Cn66vShW8d
	NTa7NoeATPjE6b4wwOaAFBudpypWMAEFV9f/hP5tl5v8JLIjoIXF2bVqK2MHOFWt
	aviH1J9r9P2Bo8R0D1qvDyKr/yRaapMat6AXsTkoDvtlvmhUwKXbk4nxbYdmpvnG
	/3NbKu9nkzCQhHSbpzQXqv8OS34nRE4uBg3PmRKYfqSwLY3MgAlanortAzb7Ol3k
	A9tXj2/lYSulAc1DN+44xqAaAHmPefAfmcPH59XHIIJ7yzU0z0YeWD82PN03qh6p
	LIQXFQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0nsf8yt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:22:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6de73fab8so16086885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769768533; x=1770373333; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IhwTqwGQwCpOE8eWbIm7gM76YBPrk4H8irWBzrqY4UY=;
        b=P5I3qjNhe/RY4q0Pco5mk1FL3Rx5hgWBRO6wb1WaXPN21PTsrk6RpZXtUUjbedrsCo
         rwI1CrH6aLoS1nUSglCRo/buNE+mSKDvHclkdk3ITBBbgJ+Yc5ATwpu+5/h3206Y1CSz
         Y6jeCOxlgtMT5GyvjKHeXHYMJF0YPZJmtCenstPShHDiPO4y1ttQzSfZidEErRiGm4pK
         9geKTjtT7Zw/YrDrNZiugKOaQvGpBQkAX3PCyDxJdzF/claJkDeBdda7jWLEbxT+akPE
         aZIZDl5lbKHI1xmbCUiwR/vluI67RMWDQvHGwpTdnxrH14dmzlkgraFhOh9kNUktPOix
         OlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769768533; x=1770373333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IhwTqwGQwCpOE8eWbIm7gM76YBPrk4H8irWBzrqY4UY=;
        b=c4KLae8bLqInJ2E9Y2VLGlt2rdZNQfSMeMUVOn+9evNxNwwe/SzDtSIQ1EqjWl1POM
         +LVvRncbpfDlkNemK/LjKAU3TWiE1usbnV6eP+nSybAzdJu6hmWJRRXYHAT5Wr+DcT4a
         klChAxbYlETPA3fiRB5k3ciFWJ6wO/cmEvbguUxBkp8WykNtfJf8l9xiifmpMLvXmXwm
         tuXUelD1O6YpjgwZARReJEXg9SA6ZiqfQ1LOELCdO3Z7hktejnrBnKa+XoMN1jL++6OI
         IIfR1BXOa2ZCWB2yQQ7++yL1N0mvDEEsp5+YDiKpsrsTqPayCZ2zeuAWgMg08LHnnnwE
         kOyg==
X-Forwarded-Encrypted: i=1; AJvYcCX9l2bAQUkMLyCr66FG6IYmct3rBFSbxR6U8D8UlCGU4JfzYo4UOpObfh19DZeuZFu6LtMph2TYrpKk+DUV@vger.kernel.org
X-Gm-Message-State: AOJu0YwwUmPhB0c+Gvg6d/xw1vEdyxh/hOg7Wmef2uKJDMi8Ux5afIHU
	BDb2SBqaGpdChev72aSyhBN8ZBrJsrD2Uly0uPRYdkQXYhfoSpTQHV1h4gNGwQFvxqwldMaLpRi
	eb07ZUtWsezOXd6/7mBF7RboTNgJ+4WPQya+6NQXyCgwcU87aBk30LDimaej+m7ZqzA8X
X-Gm-Gg: AZuq6aJ2OuU4ETI+Mm1CUHH8gA/k8V5MIpjH46oZXANN09loqJAG9HuhwG3dfr4fN4P
	4Mxj01aSFTSVpbLFif00tYA7SggsOoCJlgrc5RLOFlMqiD5OUDDgOGLvmQ0nC1cDwtJzUWPs/EI
	Y3BxbVaJJZOxIvSZ8AEMDvaeRCy53DBiYjUqKW1emL99SsNrrqcHylY0b/67Fpv68lecx638Kg1
	ipNmRNISgn9W/1P5YnFSDwjidiTqdQhQgvXSmfszasNR5ARzxjXJNRZlYsUR7ymG7BvNm4jcMsK
	gQ12RVeZSXr/n8skfKiWBapVEJMQXt7LIDiKwGnpI0LKiJccS3wWITL66l5rK/lB9vMopMFAtR7
	iKCWQQvTVKy4uIiI4WLkoI4ottFmgLwd8GuD2Khy+Q/92jJ3ya5ksTa/1TUt7Blg9unw=
X-Received: by 2002:a05:620a:2550:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8c9eb265908mr236754185a.2.1769768532802;
        Fri, 30 Jan 2026 02:22:12 -0800 (PST)
X-Received: by 2002:a05:620a:2550:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8c9eb265908mr236752085a.2.1769768532365;
        Fri, 30 Jan 2026 02:22:12 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b42569c7sm3750765a12.4.2026.01.30.02.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 02:22:11 -0800 (PST)
Message-ID: <473298b7-2b96-4ede-99f0-2fd5407ce1d1@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 11:22:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/6] arm64: dts: qcom: ipq5018: add nodes to bring up
 q6
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260113092021.1887980-5-varadarajan.narayanan@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260113092021.1887980-5-varadarajan.narayanan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XLNChtYc32x7-1j70m9A_H9g_gqEuhjW
X-Authority-Analysis: v=2.4 cv=EvjfbCcA c=1 sm=1 tr=0 ts=697c8655 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=U3Ut5sJg-URQ3oAxDygA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: XLNChtYc32x7-1j70m9A_H9g_gqEuhjW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4MyBTYWx0ZWRfXxHMzGaNRGMXC
 zeJ9XYBz+NEI0ZcTTIgEyM05OveWtKtX/6/hLRVcB/duE67APjuJTXW7TiBIKTRi1tLC9n6FfoS
 PYyz20KsYkyRX0AsnliAw9sVyYiaBwflCgjm0sFSiBj4yAs9VX45uAoHHwD8frFm4E3mtN+/pEm
 JeUyyU6Bfq6HROiNRQP2Gfg1M9I45iphZGIfw5q+X4V2uOMWhV5kp5MoAfuPOws5u5+JbKqc2iD
 6zkcq4nWSXRU9E+Hgl4/Kya34Y9JrSq20FnM9G8PbTr4lEcuMOhwqBDoRIQZUn7mEXBwEZYSx+k
 pabuVg8p88vmAB3kiEIMScuWbY96RgvvA3LQ9ZNR7tq9Tutg+W3ddfooBbXlO3ETETff6m5Namg
 qNnjKaMb6AAVZirgNaEI3fg1S/P1DB6LqeBlvEs17MkvO1goRfS6WQZH+qSAXvnN+DQ+C0qbjmJ
 8h9hNHMlphoWiXnyvKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[outlook.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-91264-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2C056B94AD
X-Rspamd-Action: no action

On 1/13/26 10:20 AM, Varadarajan Narayanan wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> [ Change 'qcom,smem-state-names' order to resolve dt-bindings-check error ]
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
> v8: Swap the order of the items in 'qcom,smem-state-names" to resolve dt-bindings-check error
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


