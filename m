Return-Path: <linux-arm-msm+bounces-116188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vVCqDBhiR2r9XQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:17:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B91356FF79A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:17:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ifWtgt6r;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eNfjsKd0;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116188-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116188-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E3BA3015466
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 07:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD10386450;
	Fri,  3 Jul 2026 07:13:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EA035AC33
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 07:13:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783062788; cv=none; b=kkBHjsrxKs7PRkq+vwapa3xUWpi8KuibduyONIIvBcKUj0RXb0c7ESxymfHg64qV3txtFQUdT9A51CDpil9lFwnQR1+PwQ0kC9ws4dJbROjJoLqhmOU/ldrHjj8Do4RyF1DMaxjGiaEmxIL8QIlSgIp1VMpv/rTftEutE2Rl2iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783062788; c=relaxed/simple;
	bh=YdVOiZD4Racla05BzVUSupDKdhPkOP8ZTmqWEqlqujU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cv63WcIz/j2qj36/F2QmfrWU0d7GNSoyv3SQooo18/v92nNdetjPXgd8C8A2q3uvQOAfZhvRJNZjbumFe4HMg74sHvS9vssR0AeoMzMC3M3gKmSPFAATCmy8mrB9zNuGHCLESYdZXstKWVgjPKJtBmxIdrNEqF18hv4Yil2d57c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifWtgt6r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eNfjsKd0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rfUl2994864
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 07:13:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLKwhFb0WMpEquwWy5esvrbPpcQrhIM5KfgQygFmYEU=; b=ifWtgt6r6NV2Ftli
	LFbEJnMqHQTSysZ2+wBgd/ecJ6t52JmAAC8o3gJKYsPrWl7bkSLu/MjxlD4KIdQe
	+vadlaDIazm+x8mYdb/PdanSdT0Sc3AiFuPTV7cCFel6qbzY12U7aeQt59ZfwKDm
	IB1AL769zKJdvkvlnpXKBbcSaYZDAPbTj/dYj7jTtocIkbc4a+u5IdcPhOQWdHMK
	vEYJ72oB6/KPUKeJa17/ntTNoDdCZ0nLRV03G6SJa0BKxVqIo3pvcSgcrBoQv+kX
	SenxrQvA+FWpNsnqhAFEusx2YSY+LeEZV7LJpIEXMGpzRdtvmZEcBaCtZRE0Vb7Q
	R6kw5g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n15xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 07:13:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1fc94a11so978531cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 00:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783062786; x=1783667586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLKwhFb0WMpEquwWy5esvrbPpcQrhIM5KfgQygFmYEU=;
        b=eNfjsKd0tB8yibe9VziBcZtjIs5kpl1RVjrkA5ZL1cAd5z05+HBodeyzwB74fC5S2j
         DjNxJjRDcjlwZn3Zb0zqXwtUD/E7AbgGOVQ7xpmq+3IcOpSnpso3DZuxhjrv/j9OhnPN
         B7qEXBKUUy7oWRnAIWyynk6oaboCPZetp/+JkFBcdRsPGZ9NoG1b6VMRJ7wEDX2FF6z+
         aNfd/KgdHPvS+lQqhr0zlMUe44ztig3eJpJBFdfEyR6Z0BjlNadaD1Ek0TPEug5AJrXE
         f80mqp+Al9IRd2e1xWVfKYbIeZS/WlaOBAyYGe7xyOl4IUqfL9dEd6TqfUr53D3Bx3Jb
         7trA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783062786; x=1783667586;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLKwhFb0WMpEquwWy5esvrbPpcQrhIM5KfgQygFmYEU=;
        b=lI0eQxGFOAiSynxhUNluStYeNfq2fLupyxVq6nDdgTPevJlXQAbWjS992QNmmUaFQB
         M6DcZZqLkR/yd0aa4CNYY0dSwH8cvpLxHLFkldArhpTiOrkJPn0wIHu6vZMqqESnmhl3
         8rbUd1V/37g9IcHTQ4NdzWc3vdfALL5X9fkuY18euKlzARfThg1X5Prb8BnPWNtSofSk
         eTi7hzWdHSX/zkaIVRyfEU543WX7ia/ca04cEI4j3aJq4PlxG5kibikA/AbwKxSMK/8C
         sIpCnkTvDiYhFipki3Zw9DJnAsPp7K0JMM9zg3k+lGmAniZ7OkCDkqF6777X1ivvJRIy
         Xzpg==
X-Forwarded-Encrypted: i=1; AFNElJ/GXGoDrBFN+QRNI+yENpfR6Dlc+2bmYec/4lFcXDqERBPHlzRKJZWKkCXgEdIZwJv0ejXqbT4/CR8XOLTf@vger.kernel.org
X-Gm-Message-State: AOJu0YzpOckOCpnuq0sPSap+VsmHJygIBbBJdDaodHfAzKBziXTI8lLo
	1j1vyBJ6ng2AMmHszDURQiwWRDeXnz4hDz8V9m9z7OaokOQcYxmxnns5hRzrZrNV/rHskM9uQwH
	7eXz2ReePWv/t06GvxDfbjQ3Gx4wZ9VwHDyaGGlIi/z8ZcS3RWqLF62VPqiiTJeIcigsK
X-Gm-Gg: AfdE7clRx93POLA+N+0/88n+fvEjSL2WybLDygbD3IPvxwzvxZ+8bjBOWfwryAyqtyS
	3CGQxuNOBGIp9hqGPUr9wmg11dsVsuXJtpTFnq9xqxqJA9qwHq1qKrvVYe8YRt8/HPADq7O6PEU
	htadX8QcbjNDovSvqSjiU6Mnags70X/kSkf4dXCK3mNpE4f5Y7duiFe+UtQbhyIYxe9EFyEjxQS
	ywrQRyYRFFealyuygu3V0OXJITwUnzCAn+tzvgaHk3Ox3KDNvIQ+kTSLqzy3bWmPWuISPINvrgm
	LvjAvttlUgFAnVMP+MMo4z6E0hjY46sRgKJd0G3sWDLQ+U4ADbUicOrrDv6CZy0caKtu1v143Dj
	K9GzZVkzLKyPVK2xGCTyk/5T63TA/NhiXb4c=
X-Received: by 2002:a05:622a:14d1:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c26b3920dmr76116641cf.8.1783062785530;
        Fri, 03 Jul 2026 00:13:05 -0700 (PDT)
X-Received: by 2002:a05:622a:14d1:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c26b3920dmr76116391cf.8.1783062785065;
        Fri, 03 Jul 2026 00:13:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6099911sm233424366b.24.2026.07.03.00.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:13:04 -0700 (PDT)
Message-ID: <17a83e3b-cc47-47f3-a7bf-bc0c92f09f98@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:13:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/19] clk: qcom: dispcc-qcm2290: Move to the latest
 common qcom_cc_probe() model
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-6-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-6-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2NyBTYWx0ZWRfX1f0MPHAxGFIe
 sssBpnTW3Fo6gQLyExWrvv94DA4H+s3u8Xbfc7Y/wU2x+fnJojZeDgdAi1RCAJaGD2sNdSopwOp
 +NpUherjsEpagOXt7s5/UVf12fr5nmI=
X-Proofpoint-ORIG-GUID: l1KL6-JWcrO-6RYAAS7ExygybBU28Okq
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a476102 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=McZegf4IZkULrlfIFoMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: l1KL6-JWcrO-6RYAAS7ExygybBU28Okq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2NyBTYWx0ZWRfX774/+/ascfKq
 D2/5eclIJBZ7PpSmMnrgV7QCJzU7sO1BISzTaQOpEK+ccUS1fPz70fb2Nm5qX68MlW4fcLmHs9I
 DEdSo6IPy9Kl9km3r0u4aLZUATKAHZ8cBJefMj5AgMGVkTAYzIrI0AKXGh4j6KUQKu3u/irzgns
 D0T1aS8HjcHkOLN7x91zMFHE5dJWgm5L1/ZsAskCKYh5FymyxsyiU5y7eOGqnl9qoguY6LkPWr4
 jm6IS5aaB+mWBQXitehmJgCvlyJufzQiT3+1SIUm9DJBQMlTI2Q9Cz0GZGTXW5bm8la57G8S185
 CjR4RopUOImYj3EZMBcwS9VChtg/3XrIT/uWn7fLqxzSrm8eflqP2OKgvNcWJYUeO/eqJO+dp4M
 jUI4a1L9WnfX2spcVGH/hbuZ5Z073l6nOsrtsdH+c2MSGvkPAEjSf2RHkuWz3JrDNB7L3bI+/Yi
 VUrDK2eEX4ISSonx/SQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030067
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116188-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B91356FF79A

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Update the QCM2290 DISPCC driver to use the qcom_cc_probe() model by moving
> the critical clocks handling and PLL configurations from probe to the
> driver_data to align with the latest convention.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

[...]

>  static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
>  	.config = &disp_cc_qcm2290_regmap_config,
>  	.clks = disp_cc_qcm2290_clocks,
> @@ -498,6 +515,7 @@ static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
>  	.num_gdscs = ARRAY_SIZE(disp_cc_qcm2290_gdscs),
>  	.resets = disp_cc_qcm2290_resets,
>  	.num_resets = ARRAY_SIZE(disp_cc_qcm2290_resets),
> +	.driver_data = &disp_cc_qcm2290_driver_data,
>  };

Now that this clock controller takes a power domain, this needs use_rpm
= true, or there will be a permanent 'enable' vote

Konrad

