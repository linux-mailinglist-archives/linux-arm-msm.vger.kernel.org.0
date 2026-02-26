Return-Path: <linux-arm-msm+bounces-94313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFLRLn9doGm3igQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:49:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F86E1A7E4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53E8D31402B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 14:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575DD3D3480;
	Thu, 26 Feb 2026 14:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hv+w9+1v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OOFAcfuy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033B73D7D8E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 14:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772117022; cv=none; b=FpBeED4pjs+dPiHlfvktCQ3UkviPgtpLR7deJl07rZHQoPPnPrRXE4Bnh/q8cmzAuXrKatKX59R2Pv3cGZH1f7ILzZWEbh9xtfqKwlESuoIeqnMi3fwvpRdgSebwbrGT2N/+Ti1KTXmdRlTpopzPb8nZvvomsSQWFoJscgJ6T/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772117022; c=relaxed/simple;
	bh=ssjYoWPMlmy5SaR5Bpo21Fb6QC7ZSxcr8Bd4H1/iGCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TcxD/aUVQWhuFYV3QRve1VoSoj13rtU00MrPFEB8RT5Kdmt9u68wWdaZu29R3CnOFOprD7F3uqC5+g2yhg8bw1lPwBS1eJL3sEnkA3UG+0VgCwZiRUBx4W0yWMtZ/c7WXt6YW9f37/E7ZVFTNC4HCLKJJ+vu0w9+Se44lfFn3m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hv+w9+1v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OOFAcfuy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAL40p3747776
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 14:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	urofc3orCSX3lD3Xa99/h+MZ/sVw1Y2QisAYKWEofpo=; b=Hv+w9+1v/5KMtX5q
	eEV02TftjDlfno9pQubVjXu9lj8qO2PcVwInP+nxDXtijEUe2ojVu10BzzFdBsrL
	ievKXUjJm1s+Vz2dYGfIMR26Be4upZWBOZZzDNlIwrfOIc+FgzFrFUQqUXubIQNa
	RNWD+LxOl4AhBOQh4Ed7yf/7vOifPsItMTRcPV/8DkY43UrQbqoxtQ7gapB9nggM
	yLI8tobvXUjCzLI3KZLAlv7qOQYf11A6RZSY2YlbvF/P9g4xfoeUzcGQJnTkEQNN
	G0A1a5RI7nAqj8lbcKgrAy8PngVxXOrzhYlVX0iPPA9b79jsm1oFpfMNMp5m55Oz
	MbKq3w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj559khnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 14:43:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb50dfd542so70402785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772117019; x=1772721819; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=urofc3orCSX3lD3Xa99/h+MZ/sVw1Y2QisAYKWEofpo=;
        b=OOFAcfuyrPy57vb186f1a8CB2utCsIzlqfbgfdhwYYWDzClyuF7D7yxbjrR3GJSmV4
         wTTCC//uafUHE8bwB4L+PBHgdV6DfIl7EQXeOQuA/Jc0CHX0ScHOLSoNPyMlV6XtWmmU
         k2qkNsztI18gK7b/GJqRV7fmngA0rUB5+9JFXvhIjy2T4zB75CQtUa1OSvq1GFDwJcVB
         YzqRKzauHUZpcHAtk03YBSVI7fGqp9cEy4Dl2jrmRHnUxeKKF3flqORaM0+mzNhtvYEf
         1CT99E262p2FLuBThTSxpUnm9pffsIrn+1HM4ve5HKgHFFGKoeZYAADeR7ABzXv5K7SU
         ebSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117019; x=1772721819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=urofc3orCSX3lD3Xa99/h+MZ/sVw1Y2QisAYKWEofpo=;
        b=W+B1gWr5aGWWLZDEtVKYUOZtHaFFfpilS5/hUa2pKUz4J1Qa1TgoqjndmiVwH6Fk1t
         rrP01KUEsWg6rnGw8nHFNkuenJaXv7iWJcGNC+1D57sImbWugN+tvKSS8JITk4wnr0Fh
         FZdeJ0aXa4PcSQa2NkGPYxKeE+VBqYyiZZB4DzyJUbirru5B3zi6XEwxeo+P8s1GgLg+
         qwE2In+Qpasu3JsdoVVKWVzea0R7NzmZibmtzh/jIVdUTKdHqDU9hD7CySpBZRtHqzr2
         c/hdU8DH0RGW/1U1cwppPikLo8TRk5FZLprthIn0gyl+kfuWj4X/gknLKYO2SCUeQ/DQ
         YouQ==
X-Gm-Message-State: AOJu0YwD+bAwfIRu5P+qPI8QCUC+Zxq1swiT9OJgIu7plhOnmaapvsc0
	l01e7a3YUuErdupHtCALQdezY0U+hYgP16D0NYvKE7xkGP07B29MeArpCdTtM0OURoyEumv8mQn
	zjPJ7mcfZF/iMTJXb0CdJZJoK4HDK0XVdKk92lXZ+5TBHKrlTuW4LmcwTb2VE3+IMbUcU
X-Gm-Gg: ATEYQzxZypD7dTuZAENGOfx0C2P3UwmjhShlGFpXstsfguaolbEzuUqKF4AFQIzW3kk
	5BSaDUtJKJIgvKX+sJyWB90OjleGqVuWqxtBYzPwhw23ovqVDFRVOp/wLNJUF1cimauSE+JhFYf
	jrTXyGX4GjxMVdZG3cKR76efJ6wqgTyyElRl8v3vmXRoljHRJcrltVF0n4jlxm20Zet/jPQzgKi
	2X41mBPbHILa63Id1T2u0elZFkIVjbzGkynCaHQDHSYfFlQ5XNcXfzsDpGxbH1wOe33MB2Fn7Uv
	cNCT2UtP3/CFDsG/Pfgu6mJ4Y0QzhrnkhfFkN6usBF2vnBnYy+td1E1F+Ji/gbRWVuJAsG7svA9
	sPwQbuRnJEL1TgNDPYQ0lQN67PL3eNjiqT97Konl7T/02VC/1tjPRWZJr51DxbgVp8tWG6iaEyx
	C7Ues=
X-Received: by 2002:a05:620a:c53:b0:8c7:9e6:3a4e with SMTP id af79cd13be357-8cb8c935646mr1876741085a.0.1772117019191;
        Thu, 26 Feb 2026 06:43:39 -0800 (PST)
X-Received: by 2002:a05:620a:c53:b0:8c7:9e6:3a4e with SMTP id af79cd13be357-8cb8c935646mr1876738585a.0.1772117018718;
        Thu, 26 Feb 2026 06:43:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd36219sm519402a12.3.2026.02.26.06.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 06:43:38 -0800 (PST)
Message-ID: <b2ace86a-85cf-4498-8c96-21c9a2fed2d2@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 15:43:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: lemans: add mdss1 display device
 nodes
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com, dri-devel@lists.freedesktop.org,
        quic_riteshk@quicinc.com, Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260226111322.250176-1-quic_mkuntuma@quicinc.com>
 <20260226111322.250176-2-quic_mkuntuma@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260226111322.250176-2-quic_mkuntuma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7B9Ov0u5wlfsA8opPVjzDEDsQtw-MUw4
X-Proofpoint-GUID: 7B9Ov0u5wlfsA8opPVjzDEDsQtw-MUw4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEzMiBTYWx0ZWRfX/3fRhBPTW5rr
 5XB2si2N90FSzPSiLDHEMWkbBy9ICcZwOuWwQuFCBU8W4hYRQz29BsWnPx5T7eobIWVcBOLDkjY
 WGoA5KEfn1mfxmjT4LFBWOwXuAqtk9/OpNIfBmBLqeqBEIfB4XIfGq57medHlHXgCls/02ctZbb
 RhNMXUVESc7tpvjKezksdiqKcdt1pUlMpHC/S3p6rtGFeiCo/fKWrmoVrDXBi+6WgLT8bXCOj7R
 j4T189rCRLwIYkU4cy+SrdvFNijsbguIDeMKdowkxrLcoU6nPuPaLAX/VZMTM/k0Cmo+nx4WPpx
 HXDdyUlcPTk5d5Mbb3Bnk07PubfaaNjtXmqVbrpWsiIzG5JCFjyiPcZq9HK8l1qjqmaKiPu0hWj
 n38fyYct71dEWxTY6QRTH2tLr7HXdUJPyZ7WbhDCTteNXhuPpps/Za9pntgxkldEWeLemHduufi
 Y5hEEOlayvBVd9Fs4Wg==
X-Authority-Analysis: v=2.4 cv=TcybdBQh c=1 sm=1 tr=0 ts=69a05c1c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=YQTEiYD7NngJoS-z9XcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260132
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94313-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,quicinc.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[quicinc.com,oss.qualcomm.com,somainline.org,chromium.org,kernel.org,linaro.org,linux.dev,poorly.run,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 1F86E1A7E4A
X-Rspamd-Action: no action

On 2/26/26 12:13 PM, Mani Chandana Ballary Kuntumalla wrote:
> Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
> Display Processing Unit(DPU), Display Port(DP), Display clock controller
> (dispcc1) and eDP PHYs on the Qualcomm Lemans platform.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 381 +++++++++++++++++++++------
>  1 file changed, 305 insertions(+), 76 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 1da8e7fb6775..fd4d524d0890 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -507,6 +507,30 @@ opp-2553600000 {
>  		};
>  	};
>  
> +	dp_opp_table: opp-table-dp {

You don't have to move this table to the root of the DT, it can
stay where it was (now the nodes are not sorted:
'o'pp-table-dp > 'd'ummy-sink)

[...]

> +					port@0 {
> +						reg = <0>;
> +						mdss1_dp0_in: endpoint {

I'm sorry I didn't notice that before, but please keep a newline
between the last property and the following subnode (patch-wide)

Konrad

