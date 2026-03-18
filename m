Return-Path: <linux-arm-msm+bounces-98448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDl7EBuRumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:48:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9690A2BB109
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:48:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D34F301701E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB303BE15E;
	Wed, 18 Mar 2026 11:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lVfmqAjy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UzyRxJwl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F554188596
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773834401; cv=none; b=kNsjY+1hWX7PeagoC5Bi23y3P6hBzRK3SB5Vx9WswGQdE+sr3tg/FS6pHuPm2xymRa04aE6jxu2FprGmmnv7B+oQ0DiiQMbLNdRRQi53yc6GjJ8Q5bCeEJ7hfsH9ilQCOg5tbyEejUVygz6Q7ffbkLLU/2APgAqSvlqoG9zLxuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773834401; c=relaxed/simple;
	bh=C4VMR2ZS2kCbi4/xv6c6uP3I7B2nHwSrgd3D/xwi8Kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lWZWjmryjVKUqiK0mZ+EZJOtShPZSd6fsXax5oAAtNQr+oF0pT3a+RIlz1lxlqD/hovShE+zKuT399y4X90cd+EiEWUfPXCx2hL4/7kdff8F2/d14RSosL+18yy0UvAhUgh15PiSl0pDvt0V04TQzvh0zqvqTrt7lf1wRuRnMJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lVfmqAjy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UzyRxJwl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IBBITb320546
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XfkIvEf2S9KYaduDgSIvZHP++vk152IwD0k/as2H3Y8=; b=lVfmqAjydeF1JZQC
	49LGem4DUP7aBKBo7sG+rT/z0x+J5M3wH4GDXXso5CUtdDVu7/uMDOGQlCLKWEQd
	ks0pHEW4xIKCBK2l+0GimuDSSkh/OQWJbBEA3kehTXxAOmau0eql7BlPIr9DymZt
	Vc6c0YoO+SF/nCCiem/9RRaiBaDEFKH40u4cJbYT6WzF6VwfGmL/na3EYRIJ3Uhn
	UAaUb0ETNw/3l59GFlAcD8XXfaWnDBKWNyuY0jxi2xj3mY2DXDPkl7dLrbNfmCCM
	EI+C71NAwid7x/Nb94f7sRJG5oYplKLs+nrd9RgImOHtXeJ+L6tpMTsK5CjjfhHB
	HUz8ZA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyr3kv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:46:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50910ca6ccaso87971221cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773834398; x=1774439198; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XfkIvEf2S9KYaduDgSIvZHP++vk152IwD0k/as2H3Y8=;
        b=UzyRxJwlTFUwzi9xBEk0LLaLVk6E5meLZ/DMbkpE47t/fZs/JF5+XygPIpG42X5UD6
         mKebmcSOOYLLKobcYVacsz+O1JAZvrmeHyUx803+HXxd/AqoFj7dXUIPs44/gugIdx8v
         h1YmVAFIFNAFJUGF/aNSSSXTHeckXHr3TBIHXd4BxyDlcOy/HkWg5Et9IR9fpMlxFIJj
         uANuMzI03B5Xilfc34wBE7MH+rH1RvaMJ3XVEyrQ4fyYmYzHZcqXHoRWtmVn4L0WxXa3
         XAkgKnSekQBkQSbNHBwL2FlTR/HfZnXJSQBXlPFjRXEBxGuGhB/iieNYaOSvCeoWTn4/
         C7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773834398; x=1774439198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XfkIvEf2S9KYaduDgSIvZHP++vk152IwD0k/as2H3Y8=;
        b=MNm10RZNlhKPK3aAB4mWA9CBf+WhzOjb+ROoddTr3rmRtsK7GgXtXWOEdqyTi2umec
         3KKpvL9GRB3JOKikfCKg0sR1QGZK1htOtUgUXhSeRS9gR9S+pBiLU8exz29XnkuO+P0J
         +Vyw0A3WrFbq+s2uMZBwMz10def8oLewsJ8sevBQ0EADOR0exgWG9HYIsP2ucRh+BRhl
         cr1kFB0SpRL/SEXXCCtIDWcZe/qS5Hy1aIm9id5NlN2YFiRZ+8Wqo50edZBKvP7mtAdY
         LAozuADwF0BZNG9BoeKIjad/41BSGY6O/j3iir9sp+5MyA5sZVXeI5nvxYtYDYS5Mg8C
         hhAw==
X-Gm-Message-State: AOJu0YwuKvEqOMpc/+HozxehzZX+Kcl49/9XLkKiqXvwDXJgeACHmscn
	aMYkzvZJtynMuK3JCqhP7e48fA0FL8ksxQFfrER9Xyt1xlXGYQ1TPRqo6QC8CjCxvF1QF0gByKW
	kYWMeB3L2vw8K49fbyIh20LJYj6TKWKJShNfDpQ8MpfoSsHliTyxsOuyLQGH9rrLtw+ALmdg/5V
	Xz
X-Gm-Gg: ATEYQzzjUU6bijsuq6uStNTnj1BBXEj6eb8mKBJQJ8612X9O3SDlgSPuFgLL7JxQojH
	DDpkPgRgps2OEZ8Pe3NfKg38xL0heDrz1inci/zGG7yyQOs2Z3jIJmPUmQHbiFQMVDcoUWjXvTa
	Y7KK4yDoUzVHdTKj0fmFHU6AxLUFKqkWx0SB8VsWMMdqEs7v3c9tkb7tP/5FViCukc6lUVXNaE2
	VwHL5ShCDwdTdKheO2c9/2Gize4cqTW2iqwwXA8hCP0uO22C4MxAYpVaTD0yErNUZXBMst0qywD
	IphB6nn/VHXXG0Cot37y17zca9DrgmeJthmqVMGRUN3ILQPIs7CYndtIHdqZAm/gq3UGA1UxjxS
	46wErI2gC8M6t3hVIoSeuiKB3sZizINyuFZ+LKdTtviBnYLWsPGAMtZkJAMaKQTa3dusB3Gmzp1
	1ooJM=
X-Received: by 2002:ac8:7d88:0:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b1490a4d5mr26569751cf.9.1773834398356;
        Wed, 18 Mar 2026 04:46:38 -0700 (PDT)
X-Received: by 2002:ac8:7d88:0:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b1490a4d5mr26569581cf.9.1773834397962;
        Wed, 18 Mar 2026 04:46:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f1689d2dsm184500566b.35.2026.03.18.04.46.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:46:37 -0700 (PDT)
Message-ID: <e5dcf0b9-3a46-4432-bd74-4c509bbf49d7@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:46:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] arm64: dts: qcom: sdm845-xiaomi-beryllium:
 Introduce framebuffer
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Sam Day <me@samcday.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Petr Hodina <petr.hodina@protonmail.com>
References: <20260317-beryllium-fb-v2-0-36b69dfb760c@ixit.cz>
 <20260317-beryllium-fb-v2-1-36b69dfb760c@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260317-beryllium-fb-v2-1-36b69dfb760c@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: T81odMz25lvtTEJc-hkfnoHJHSMR_hFE
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69ba909f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=sfOm8-O8AAAA:8 a=Zz-eXXhDp20MwffFlEUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5OSBTYWx0ZWRfX10jbTVapFIrQ
 tbZ3/Lx7Fw2oVsMgp7CpeGilnb03Mm+d1RXBL1xCwT6r4rAVoJmpgwxR8A/QipLYKKVn5rX63nt
 F5RBy6E/6hUV9EnGLe0VBn9IKx5q6ft8Cgu3fobbXkLXwFTSRji5L4/8VMJ+OEgY/Kknar6SJqa
 mQRoAkRmooO52WZ9KQ3f8BovTJryMzTQU15GS6HP/zYC0t97TiAuxPXrIIm/acdNDAlbq3qJq/A
 j+BVOg73fItaxX18ovxhjNwt901Vga9TiapZRAhBNmKHfZnQbKorHGujGGgyxOJ45kshIPlxbih
 JQwjg1qWsnpKyx1V/o+iriQA0NkAKzbBzLLVrWNLIsNzBDTettzsPOGCQd4f5UuZWm51ZjnMLKg
 sybCQeBebs/ejIDviRUfOd/YAVhBZBkT1FYo3AappFFmh3U9tqA8wGwDehLbZStEhWxOGeVVhv8
 5WCJqdkWvn9QoAPx7HQ==
X-Proofpoint-ORIG-GUID: T81odMz25lvtTEJc-hkfnoHJHSMR_hFE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com];
	TAGGED_FROM(0.00)[bounces-98448-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,protonmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ixit.cz:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
X-Rspamd-Queue-Id: 9690A2BB109
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/17/26 11:12 PM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add framebuffer for early console and u-boot support.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi    | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index 01b570d0880d6..b928100f6464b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -39,6 +39,22 @@ aliases {
>  		serial1 = &uart6;
>  	};
>  
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer: framebuffer-0 {

If you don't expect more framebuffers in the future, just 'framebuffer'
for the name is OK

Konrad

