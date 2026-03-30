Return-Path: <linux-arm-msm+bounces-100777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHquAitdymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:23:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B303C35A283
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EEBDA300BBBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019663C2763;
	Mon, 30 Mar 2026 11:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eN+/nEud";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BA1GI7z3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88BC3C3426
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869776; cv=none; b=jmS1t9EQ7oWq5BtEiVXGwxBQ95YnJubVh8bVFdy0RA/CQNKadMSc99nlkKX/T6qwGgE9gbrrI7DZj5bPjktX2oh8N/rCzJIqkyMN/akW/Zhrsau4HLQ6+ZULfBQLvTfvM79TiccpG5+B/pVRPHiYzLwiRK1cUUE01Q7cu/oFe20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869776; c=relaxed/simple;
	bh=EcbnKwvlMQtKZ8zaJ6Pf3gDfNFf7RB2favD1ONugsJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rSZ++MKW3E2CRmTjiVJGSUPYRKk+w/i9MXr3xCJqXC09Xwgln29lXMwJFawX+UQcyFWnLbbdvjc0bIOTMNS693CWb5LtpOnc2DCefLPD0YEpc/GL2H4Zvg1O0R0PL6chanqaj1/I7VBkr7yjhNNU124OlStFNphNZIJXEi/FgAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eN+/nEud; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BA1GI7z3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UBEGhO1402790
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	plDxEJIEjCNBQg3n0O4+/HclwzWxwaqEltwNdOaJVbs=; b=eN+/nEudwXb+wVXd
	Hlj7gMrI1Nxnan1OU5Gb7o6sIQo4OdbCDAH4gPtAgRNax21N9Xr9M0jB1l5xU1O/
	NYdr8qQcwIQf370OTMeLJ5WZvl8PbCgsP4DoLpSzEN++Lqws3njCQZdYgzbVJ96b
	r+n8VPsSbKkztsg30WPBqSzztDGn0NODb7bTqrOUH/2v38d6Gnlvz9I6OLiEnvgm
	oGNOhtNNcnz/z+3IRGjPaRqziSaSLqA5n8WciNbzISDKkkWpBsVbzQyuiPvJGPFx
	d9mckR9y5Nbg9ODrq91rWBoXs6Ibz4kEg+0o+0VPy1Gu57k4ZwH6uKFHpG2qdaoZ
	y7dKxg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7r4h8124-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:22:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89cbcb48003so19699736d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774869770; x=1775474570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=plDxEJIEjCNBQg3n0O4+/HclwzWxwaqEltwNdOaJVbs=;
        b=BA1GI7z32qTodTtLUs2BCOoK6RSRRMmAXCFJxVxj5bgsQVUcLliG8WidnjhKGBxhBX
         5RsFq/PMzYxmQmYDKnasJi/WPp6DyFL23b9w4jztp8JMKQUx+iF3e5tx89TxY42MJfCF
         rTD/rPbCcNXFiuuWVsE0HJpgSos4A+rPHQTOfVAFbfITO36Y70oCmMcHrGqEusR4f0MF
         csPglzzQ95sIasABAvOwkPglAt/bRTYmKPLMxdNGmId0bNOxCZvXhDfICMCBQG9GZgqg
         k458JKFWna7JTLNLQQyJmEt3z9sCPACNDklO9YZUQO8iFbzVoz1/8JZOiPiWSf7FcGNU
         MP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774869770; x=1775474570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=plDxEJIEjCNBQg3n0O4+/HclwzWxwaqEltwNdOaJVbs=;
        b=RexMVZ7QXdzRrgf5PwbcGQs8NXymda6i/lasvqEVb2lzNv68PAJt1XJIUJEXwObOTL
         gNP40bqZTz3Mor/7+SZ9ggvI7YkUrBqUmKv0LXJFmce7MkKnFqpnJpMhBbgMxdRXc0YJ
         6B4EyEo8inGbxlmxgEMohrCq8+Fblj2R32uYCXjlnBColmgKOmzFqO+JmqFKgdICyg4X
         M/0orLaxN/XZxoFf8konQm4+D12XOlm0F4Mp2p6fapvlBggTTbUh9tRzEJJPj/WsbdtB
         dso7wUP2GuE+Fu6Sg+KZjIYIOmNW8Yn/faTDDf0L/NxR3Ov5wkjz72jxg24ETJOFbp/T
         n3Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUJJGfC12ssqDsT7QIISl2pwYafPtiVZRawKVfpvUatIit/cWq6IRDXxr3dV/P2VMJmnakByQgQctgzgtKk@vger.kernel.org
X-Gm-Message-State: AOJu0YzDR3hszQKfXZa4Y/aWnh2k03wwo5w+idv38IsXW0V34eTcp7cu
	YqW+WnOkP/U6rPyHmPnKH43bHwX7bTjt5W5bA3OKLKSzjnM3MOZyHeKuW6F7GHKg+oYAW/mfSpy
	QiQMhAaf78BCfnuuIrvXYVAzeIJkcG9gg5WIsNemXR5mLnl5a+jJ05cW+slJpGSyyGiQn
X-Gm-Gg: ATEYQzwjzyUU0s3LS2ajjwjAk1bByyq3JaGtBOh/2ZjKKgyHafD1OOiZuiddKR7i/ZO
	KTS5WyQ8BAXX8lv75zj8A/7a6JPHwklvClXwlbTdGsKSiXdIYaASNJpt8E+znql1JFcT5vv64zm
	YkbNy8fxklc2O+QqwOjdlK0uCyPdALofb80WwrojBWWI5xgLP3FaH5oVKIujI0kxXtpjG2MPaFK
	0rxj22tEhzrjygD1KQxW/B+7AMZtAPuEA8W6uMEWtCmdj0V3ns2a9ctgXl3kJfyeZx72aMQBuGB
	BV0muq3IfZEXiGBuMap9En3f7nNTMArVkhJBUI9PgWbyvmpYySlD/BHiTH6MSgQYoxqSWtk29j3
	MmbfwvOJAzyGzw5CQVE+k4oBGH9IiZzwq6IrkoAzkidhl9U+iDOwW5vflE2/qK6U4SH4AAOxHO7
	xocoM=
X-Received: by 2002:a05:6214:528a:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-89ce8df70cbmr125942706d6.4.1774869770144;
        Mon, 30 Mar 2026 04:22:50 -0700 (PDT)
X-Received: by 2002:a05:6214:528a:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-89ce8df70cbmr125942386d6.4.1774869769508;
        Mon, 30 Mar 2026 04:22:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae24d6bsm276245966b.6.2026.03.30.04.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 04:22:48 -0700 (PDT)
Message-ID: <ecfae618-b2fd-426d-ab2c-c13ba5d764f1@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 13:22:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
To: cristian_ci@protonmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com>
 <20260327-rimob-new-features-v4-3-06edff9c4509@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-rimob-new-features-v4-3-06edff9c4509@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4OSBTYWx0ZWRfX/T8x2mEEHstr
 1sSX4SfU5JpyCFIo+Xfzhm1pJZ7juXAaeJXbcTpIeXOulAT8zVh1urtbH+a+AhWc207ccKry6V3
 8N0ECqtn2O3Hjuz4j4TJ/B/KqMi/6ytZTBX/sQNVHkKAna84acamfHItII1ZUSgbsk+8Hx5uNAn
 TSmTPKFWP0MmKbvvIi+eMxpF2Bhrk3cGL1WgOoiCllUOyYP6j1gsklusMqt7pjaCA9PdI8KHsqO
 /kxw8KTWGeb+qElGRafnN3OnxzkkxlWN3/MV5X7/bvhxJ3tTjQy+3fCYsu5HtN131p+G2gFlhzg
 4AuJjF42YA/ymvVDzu6B3AUJUe6hkQgloYQQ2JO97ziowQ9jYMOZ9b1ZxL4UXl49fXQj75xl8Ah
 oxaGYa/hVtjGa8zMtUw42BdMqQPy4rvnaXuEHEkpiri9br1KPdZdIkNkOumPk2vwM81yBQnACLE
 V5nMWpUo8WCfU5MVCkA==
X-Proofpoint-ORIG-GUID: P1ZJ8qlSuWQxVD7Ky7UtLKzhJEcRD_2o
X-Authority-Analysis: v=2.4 cv=PI0COPqC c=1 sm=1 tr=0 ts=69ca5d0a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=ER6jexHYGgKHINCZH0oA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: P1ZJ8qlSuWQxVD7Ky7UtLKzhJEcRD_2o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300089
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100777-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,protonmail.com:email];
	FREEMAIL_TO(0.00)[protonmail.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: B303C35A283
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 3:30 PM, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Add the description for the display panel found on this phone.
> And with this done we can also enable the GPU and set the zap shader
> firmware path.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---

[...]

>  &rpm_requests {
>  	regulators {
>  		compatible = "qcom,rpm-pm8953-regulators";
> @@ -244,6 +310,13 @@ gpio_key_default: gpio-key-default-state {
>  		drive-strength = <2>;
>  		bias-pull-up;
>  	};
> +
> +	panel_default: panel-default-state {
> +		pins = "gpio61";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};

Nit: ideally the pin entries would be ordered by the GPIO index,
via:

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-nodes


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

