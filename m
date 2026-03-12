Return-Path: <linux-arm-msm+bounces-97271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLpCKQ3nsmktQwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 17:17:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA512275697
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 17:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C10593012C72
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 16:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614313E5EC2;
	Thu, 12 Mar 2026 16:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LnSXq2hf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aoQR25PW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362A43DD52C
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 16:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773331820; cv=none; b=u+P1qS9+zLY84qVzKWbteRS2FLjezlvFpAu6Jz0HJv3tvSiBpqAiVFcS9NaJy5wkGL8rJScjbzdRU8kspqkH/T1+2m3h0e/PChy9ssfNT+b3U0lQ+ptKH2yxIkxOkg0vZkChRUBTEq1kKF4K9TEhN3Kk5y4hKa09ZMugdCfUO58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773331820; c=relaxed/simple;
	bh=ZOmnShTuNBzLL2hRyVNZPCuYTBxxQ02CCrSoZtvrCr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AHCICfrPWatnfAGrYpfcjgGfmLXwjQC79H3pB5TbpfbMk33/EijZ65hZG3xvV+Df4CiIsF9kk3cWSeVnq3+EJ+6KBhkdgky1MT+30Ewa+e9r6bbME4aSyFsp3Wnjoctm36diTeZSqVBIx8s2E0H+w0gT00j8wiRIU4p2zO3wxaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LnSXq2hf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aoQR25PW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CAM8Km1756601
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 16:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JDLExPcvsDULyL4g7f+9Q5zgZba0f0HXxjirJgVkFbE=; b=LnSXq2hfrMcAlCxd
	5X0eRLYA50gnUghuQ+ebIn2wFN6/EgT/vApYTlTftm1ugyNT79iiaXVoEQ6XNYL1
	I+zerzVOZfeZwMHFmU3GO82tiejU+N72JJTxadh1yl/N/JI1KCC/EbbQtg3JvAg1
	HGOZIYUaruDROEdDnNXcIjTU2gTS0M+g7GI1aW7/D5y5twy1OFNZEOhje85NHDCw
	5YnE1vpeHT9qkx+esLbJJQHrBNVnZMMDGEfY3patJM0UjU+vgeuxHSXr3nyidQS3
	pVIM8N84xXYcrRaXuNqvknzOTuFVV5QjrVq2ALW1LAY8jNNdrRkT6vID1dzT3tRC
	5r71WA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53jqen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 16:10:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd81ce6fdcso1096932385a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 09:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773331817; x=1773936617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JDLExPcvsDULyL4g7f+9Q5zgZba0f0HXxjirJgVkFbE=;
        b=aoQR25PW1roybTwzt0OUDCr9p7ugyhCGb3FN3qVqA1yFiTYmMh1Mv4y1gsUm/UoAZ1
         n0OLUaJ4j+txuJIDEUabXn16treysVuBGST84VDDn7RXC7HnI2JCtoOMFH7rMPeAf6E1
         tuvzTG3l1XSS8W4G1BE/8AWI+hujmm3+1ZZEEhWztKA4ZoyAG6ZTsMP0HUPF++BJVTtF
         31P8ChaFLJTxhL8YjumYlpA6XD8xUn23VBJWcTub90+jhYeCWTKG16bdp3i7q8gtaiup
         3ng5WGojPoRNX5+J+bYQWFEzt5b+Kuq/DYWP2vX0mOgRl2oUmu8iQIOS30kiqvYxeu5I
         CTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773331817; x=1773936617;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JDLExPcvsDULyL4g7f+9Q5zgZba0f0HXxjirJgVkFbE=;
        b=wGY1mMnIu5GasUt2F6h6UTJuFyqj04v/wGrU96dFhc2FwLc5o2qemT+zndETMl2Gad
         bW4ugJs6u6PH3Si8QQErtZ3pzNGHLQop7YXJnzVMYbYdU4jMV0DRIBnDroAy8C1/U70L
         u+07V1sOk31Q/AIdtRJiz0s+CE8AthdvOcdHEP+4/Ytuz8PApvuM81fLpVT2+L+cGeCT
         VcrZVaujs48yNBez8TOPapkWaFzCUhQem6A4s8O0P2FQQDVcb9BAOFMp6AcOyUPQRAl3
         5iVZrp9eanSXI1JDI6ZkxUJy/8OODQ0+wPGxKqPD2n85HDpCGAeMAUObvJktktpNw2JM
         OPWg==
X-Forwarded-Encrypted: i=1; AJvYcCVfbkXg3WwzZ4t8HYLfTKWIXwKmRQBOMi6hlxa6f8OKIf6MI3kvND7NjQXL5xoXtjcbEKX1aMEnvTEFTpfd@vger.kernel.org
X-Gm-Message-State: AOJu0YzN+Y24hAUlolZq3rsIaYDj81ty5GSt6YgbHA2kd7JQC+peT3TM
	GO15f/PQoYlCW88xqoDaBGDUqPwocha+syBQlHd+f4DjRLDHP/3bRzC5lPwJZPErgJtzgBc8Ot8
	dQ2M/g+IZSg0yMn8nh8OkTNXfxkT2DY86FtGOu+Ujy5Cf9BJmMejjJYWWcJorXrccSsK0
X-Gm-Gg: ATEYQzxkj3etd3pnAyvLI6FnDErnECp7ilI55QWee5Yxz8ylbslIf8isB3JrxJri2DP
	R+OYRY+JoE0zEsVzFaPpo6vK0fb1QcxCAds3jBh9bLjnVnJZKWn9GTbryKskJVbUnc0lGR2gsYQ
	HG8nBF/KT2+6Qw7mBjdfe0W3aOAmc1RyeXSMQge/1I2ihAaKwAwNmwTwSDcf7cNOsz96BBqj3gK
	k2h4AlWakwm6MKeIrNltiRPhKQXG2WegBvnraLEYmpJlDKwBPE8eSu5JJtlK7xuPry6lnNx1hjX
	uW6cTnhHVqoZL/IvBJu42BK+aaPnv1oh9G5otFVqfvEzogms+tG3Fgln6TN27YRoY2SE3OqZmUk
	GGRKKN3h4OdODqC676vbLVr4sc5WjfxdnmlB/mgZtR89Q/gkT
X-Received: by 2002:a05:620a:4892:b0:8cd:8bfb:a4e with SMTP id af79cd13be357-8cdb5a00407mr42134385a.4.1773331817506;
        Thu, 12 Mar 2026 09:10:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4892:b0:8cd:8bfb:a4e with SMTP id af79cd13be357-8cdb5a00407mr42126285a.4.1773331816982;
        Thu, 12 Mar 2026 09:10:16 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f708sm338393235e9.11.2026.03.12.09.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 09:10:15 -0700 (PDT)
Message-ID: <24b9ffe9-d21a-4fb6-b9dd-b6f2ef5def6b@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:10:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v4 1/4] arm64: dts: qcom: sm8750: Add display
 (MDSS) with Display CC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260310-sm8750-display-dts-v4-0-d571a786bb70@oss.qualcomm.com>
 <20260310-sm8750-display-dts-v4-1-d571a786bb70@oss.qualcomm.com>
 <t5e6iw6lhbig4mub3ot4jofcbeqvz7v2ncltlorsun66pqyxvr@3g4acm5bi3ga>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <t5e6iw6lhbig4mub3ot4jofcbeqvz7v2ncltlorsun66pqyxvr@3g4acm5bi3ga>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b2e56a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=N3r4J38z46KbWyPOPrQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEzMCBTYWx0ZWRfXy90x9jBvccfA
 /PmG2Sdg5hPyCzsld/uRU7ipHLmcW6QSQezVX1p9s4CbflRS24R344fP5CPu1Zkd7sMUkICNXZc
 ZuthsEg0zQ3Cu/XR+CKPDvMjtzjOBzk7ZnsfyZbAT0glvQDfqrPEaLg3B19uFbeANCnETFke6Bv
 YSCrrvoX47QPjp2hyBZNW9F6nozASTnL62EjHjeFjs7IETKtB5rwZAV4kVWyHvOmtq4tIG/j32t
 qg4iu0Q2I/CI3YsbLXDhZJzsMMKNAu7E0njjUKri2UPufXSqpUKkYjLIPy+wUfXR0hCzjZFEo59
 sYDmUwI8f1L97619kDXwveLyf1Z+O36y+jIjCZu4JbOOOX6l8ccAmVtzCt1rCHHOOMQKSNeUh9C
 6wmQDmf6zUvq767isoonihEeZkY6Sku+kkgILInuMHqNwHtK4JV1T1CgU/RzxETRAw6gGXGID+Q
 vzjtGYJ9QUAGvQI6LJA==
X-Proofpoint-GUID: tELq_ttrHGZy-3hBbDab44Nd1wjbmNYK
X-Proofpoint-ORIG-GUID: tELq_ttrHGZy-3hBbDab44Nd1wjbmNYK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120130
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-97271-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DA512275697
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12/03/2026 12:56, Abel Vesa wrote:
>> +
>> +				dp_opp_table: opp-table {
>> +					compatible = "operating-points-v2";
>> +
>> +					opp-192000000 {
>> +						opp-hz = /bits/ 64 <192000000>;
>> +						required-opps = <&rpmhpd_opp_low_svs_d1>;
>> +					};
> 
> Drop this one, please. It shouldn't even be 192MHz, it is 19.2MHz, but
> it isn't needed.
> 
> See here:
> https://lore.kernel.org/all/taqh3ipe54cgjwcvyqnysg7dx56mweo7zld3jvmv6goq2vo4b4@ea7ksdyyn3dh/

Ack

Best regards,
Krzysztof

