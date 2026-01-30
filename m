Return-Path: <linux-arm-msm+bounces-91256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJjDNWN7fGkONgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:35:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 279F3B8F5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B4473300EBED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 09:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DD731ED6B;
	Fri, 30 Jan 2026 09:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VR5W4POk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DkMAMCK6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A77E354AFC
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769765673; cv=none; b=LFRBIS3Lk5BQOA1Z9lucRzVrXk35hHFuZIiFaRbAo/9n+TYu7nN0o7SROOCgW5pqtST8Gy3iUFyEr8tb7DM3ebVNJM7UjrTyUPK8EKxpb2n5vCKw9JwTpeQe7IjWvbzeMJUViF3rsgb8SYAVcKzp8yXx8q+6lSHimVf10JX+I/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769765673; c=relaxed/simple;
	bh=/qm+laPxDQSVVEBM1MDc3pzP5L/h6hONLDt5AdW3/s8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NAQY+tZiXioeT8wxPiE5k7bXA1I38eKXPpO+OshDptJFkTwjrQ4AwsRUtlfCRz8hFOlrj4V7wosJ+j+P6H/dldnhuI/I05FLSx/p/ojUqv7q2uWXI0ZgmGGWwk/csjCVdJFjrKt2wXqhaENhXa1UrwA31WSNVUAAPmU0DO3Z/i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VR5W4POk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DkMAMCK6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U3Vj5w996159
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 09:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2STZ0D4tnVYio8ZJ6lqbw7gF65jH7c36j1+cGpuh2Ms=; b=VR5W4POkW7p4mgLT
	WUsabdTPxSMe3U8PWJRjPwF60csEO7Y3SV27LxgdxpyA5PacEXmApgzA637byRGG
	ZSB7Yi6REfN7w/Ome6PXKYkQBsX8v03p+WNtEvfGeBvWSPKOOBbJk2PjPfOol3KQ
	2qQgb/hDTNXgd/4Vu4dujT844MviJjNQfxp4wvZbqtjaDiQWRO6b8vRUuFmjZ6Ox
	H5liuFTbkPg5DPVH7eRv0Pv79EHzwp85FbRHq+dcYR+y2PrgLe3avgorT28wuwc5
	r0NLWdj+901bxBeHzQQgsC0PQ/iwNcgeI665mUi4rVnH/AOfh+czRtPrC6WsgPTp
	rYatfw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0bvvjkem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 09:34:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88880bc706cso6574236d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 01:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769765670; x=1770370470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2STZ0D4tnVYio8ZJ6lqbw7gF65jH7c36j1+cGpuh2Ms=;
        b=DkMAMCK6qc9ENLpZ7yBuH0k2tyDarrPPVsZn/WiTMOvOhtRwlQd1o2quBV0Jv6kNnL
         6CpdJhHAEhqpdjodl65mKhQdjsm4fafYfLo5uNtJvrOCYprp0xsNjN0VEHeSX6et9z4a
         2y0GnxGjWP4GsZ2CJ/bS5LXbxYEUGukNrY3/Cb9x68fPnd6dOCg0tUT2/ftQ5Aq/nXtJ
         AoJPALz5SEaMbDBG9hrXesIFN+MQylyLoDRGSLSUJsGoFix9iMYcXPnh7stCg8ljGcV8
         1VIF7JwnKy0yQmiEK2QjuZUhG6b15gGcnfWmyDVYncluZSTF8lQWcWWDSMix9QRPiJSy
         QZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769765670; x=1770370470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2STZ0D4tnVYio8ZJ6lqbw7gF65jH7c36j1+cGpuh2Ms=;
        b=pYwEqMRZs9IpyZc2MCfRnpV5/QP2Ac+UGni9PRi23RIQx7icsy7p25j+ioDMUtYXC5
         c39hFBWc8HS9XM1n5q367JKXXtswnhkXddzdsNErsxcinNZmT/0c3c1DKFfI4yEDZwgh
         Ey9R0QgiN5rpasxHkz1Q/+j7/NsZJGQmTScGNNJXqnbcr4XzyIbeO183uTSnFalmZwm8
         T29E5tKjcLw8XRedPdKJ5W8zgyxCh0xBrZDsvV8kTdnyBZ9HSOwPeQKsA5TAEmWgoTFD
         cGfspU/iec0asIDOwE5O7q/WBtOyXJE+rh9elSoZa6ad57gauKJyxsKId6yw1vrAElx/
         qLAg==
X-Forwarded-Encrypted: i=1; AJvYcCVoFhxPvMEkWBbRQVv1x5bol+O3iTtv5fafsGJDUzmkq1/0Wc/UkBsFHCTYjVm6J1GK8EbU5FiSFiCD5A+h@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr8yZ561o2L4zmKNetHD+DR5eOZZ9HPnQLvheVou/8ZliL8axe
	5SANuC2slvD1dNA+34SJ1CHzb3nH/hq1tdk7mNXjot43fWnbRyPD1aFZs4zKHz2cKGnq1DIuzHo
	HiuIAuVWIWbvDrs4p5n1VTrYvo7uzWWHZDHPjO6NBP6PV+cKelPDsnKFpdNg/Aj7P2cpC
X-Gm-Gg: AZuq6aJEMxEyp0HQA/2JG7HFPkAk4GfW98cqbn3eZGJC3ICxWrTRvSoKUIEq+Saw6RQ
	XXB5zFw2JTqxbEqBn44jUqGTtQw2weHS1K0vXa3OqjNyf6rGbLbD9Yf7m8AUI3yMlHLqM2BKbMJ
	6FNxndRPWClXEzccuUk2Uyh0NpikUHxfsz4ymxtA0dK1EoFc/4Qvo8TncW6gXZ8ce8a9I2la0Gr
	LJiMfraskM7w2T0oi8oYOZp1rFYS5WHqj2buGKNj9bhbjEMCq8CWVSkIawgAxcgiz/XdqDRps2R
	xvh0ujSyNFS409ZwgZbnDWoum1F8/6Z7Heom8yyA6rptcyCBr6YCymDgMtkvNp+uVB3dBVI6MY6
	tEweIJVygigpow7Zt+0aFvUMluPffiJDse+Ts1zX98LF8nl4vDaEjd3ix4vt4j1w3zGg=
X-Received: by 2002:a05:6214:4d06:b0:894:a36b:f7df with SMTP id 6a1803df08f44-894ea188ae6mr21143156d6.8.1769765669758;
        Fri, 30 Jan 2026 01:34:29 -0800 (PST)
X-Received: by 2002:a05:6214:4d06:b0:894:a36b:f7df with SMTP id 6a1803df08f44-894ea188ae6mr21142996d6.8.1769765669267;
        Fri, 30 Jan 2026 01:34:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4691d15sm3784885a12.19.2026.01.30.01.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 01:34:28 -0800 (PST)
Message-ID: <4ad700f3-da8f-4175-9172-3fc4d87d8152@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 10:34:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: ice: Avoid probe deferring for un-supported
 ICE feature
To: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        mani@kernel.org, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260130091118.147379-1-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260130091118.147379-1-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZdEQ98VA c=1 sm=1 tr=0 ts=697c7b26 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=4Re6pYePfbHeZKqWRTAA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: Lp68UxSjHsD3hp-mubsIPXzCWUwY6L6H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA3NSBTYWx0ZWRfX4Hk1LBmdnAB1
 s4YI1PBBOpaE4YgLVfIHI+iN1kQJzWbc+5dTx06xvbKY9DxxBfz6GwyJUj/gyCI/AwhgIwlEqIN
 ia9hlfFsNCm/tRL3duCbwnefTtW7DOIfcx1jWjik/dM+mxDHMICIX4hWguPEdnqiEJKLb8bKGj0
 DDpXAEwSeiR10PY1NzvDo8fzjkVZF9Yta7RFshRGwleYor5TCasHzAD02udAkX8Q5yez13QcLqO
 iV+KkfCzfawgTDABoYPYDyH1HB9hcGQOY2shMprB1zNhy3kYiTXWyKhGk5upXl7Dun2JmJvgkl3
 jOpiWWYkVxzFcAp88j+Um6WoYmCJ7uQJ4mhp1Q4KnSK4PuLhTWltlZpXnoPgzcMhcjS9sbyOytk
 E0OQwA4eh48aSGZ1pVRrsFkbn7EM/c5BtoN7iNH0eLWgXxyP+3IHYOxPkT9DiYR9xHRWU8SOwPc
 gK+hpLrMAcHa8+bfD0A==
X-Proofpoint-ORIG-GUID: Lp68UxSjHsD3hp-mubsIPXzCWUwY6L6H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300075
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91256-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 279F3B8F5A
X-Rspamd-Action: no action

On 1/30/26 10:11 AM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> ICE related SCM calls may not be supported in every TZ environment like
> OP-TEE or a no-TZ environment too. So let's try to avoid probe deferring
> when it's known that ICE feature isn't supported.
> 
> This problem only came to notice after the inline encryption drivers were
> enabled in the arm64 defconfig by: commit 5f37788adedd ("arm64: defconfig:
> Enable SCSI UFS Crypto and Block Inline encryption drivers").
> 
> Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ice.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index b203bc685cad..ab9586b8caf5 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -652,7 +652,7 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
>  		dev_err(dev, "Cannot get ice instance from %s\n",
>  			dev_name(&pdev->dev));
>  		platform_device_put(pdev);
> -		return ERR_PTR(-EPROBE_DEFER);
> +		return NULL;

Wouldn't this wreck the "actually need to defer" case, i.e.


qcom,ufs probes first
  calls devm_of_qcom_ice_get()
    "ice" reg is missing, non-legacy case
      qcom,ice is absent (not yet probed)
        return NULL

...

qcom,ice probes

?

Konrad

