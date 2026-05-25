Return-Path: <linux-arm-msm+bounces-109663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JbGD1ZNFGqnMQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:23:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 935295CB0E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 049203021E7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8FC638423D;
	Mon, 25 May 2026 13:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KxzpXi98";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UzNii3Ol"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E30A37F758
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779715088; cv=none; b=L9yXHYNi7zLliCYPYMYuF4tPVol7bFuhB74xNtq3U0pTosewb+pc749PT1zDDNwbzlatLzT/w7Vc//kVXyuOcVTXZPF8gz3fA9/yW4y44Af/kcSJGu6qHmjH5obDKgBHu1M34FSp2KGnHWA//cvh2HdzOf83yyLkCAYpV4avbKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779715088; c=relaxed/simple;
	bh=6AhL2Gv+ijddqqx15lHdrdKo/NdDZbe2xZ4xnLmFRNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MXOlW6j7TBKaPzgiaADjlb1Pkuo4goISOeOv3ONLjdNgVDrhJJj2xquOAFVCDiF8ctqWwXB6lqDEB4eX79qUfddd681fnkl95TOTf78j/keT8w/Z5B8DFs/RSISQR2Aqp7L7uOEgOsamLhcdUyspX8OF7VhijgSo+fyLZSRZKfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KxzpXi98; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UzNii3Ol; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9ErRi080260
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ybURYAZAK09wyFO+bp7VbLScJXcQAPWGCyuQwes617Y=; b=KxzpXi98vAfDD7Ok
	Dtx/Pd+T5NgeL6NfqYBrlmaLQpP4+I2keRIS/IteTFnwocTsHROwTUwlI2UkghRz
	bC9FVXdRj8Sz4u5v1dNeIJga/13xSLTTHDLrUJYCFkaDnMss3o6+nzS4En5cnd3q
	dR5EGuoF7bZp4EbDBwyLudDVxG5l9yqggDCE8TwHbUufTix12kt/MHtot8gw3WnA
	p8ZkcJ+PoS3+JJJnBbG06VSREKJyCPZemw5OveGzDaz1ntb3+LGXzY6Zol2ALv4R
	vJdx9AWxrSiXK3ps5MfBEdkj/NysFQjexOugo7qzNLDQMj1Wv2z31XnpHWSDMBZ2
	HUsIHQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckma8s5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:18:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-914aa01cc21so69442385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779715086; x=1780319886; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ybURYAZAK09wyFO+bp7VbLScJXcQAPWGCyuQwes617Y=;
        b=UzNii3OlBWq8T0zllpp8x5ca3ABGAo3RjqOAfR6FQja8+vcX3PjZGLmpcxNV9yCE8E
         bmUqnQzO1+DuxOL9cobgMJUGPOX9BtBkTVlGrNx6iyF0HLt7LuY/WwFX08UuIqa2iD6r
         Tj6wPy3UWc4vlP84QVPbsyZzGg3aij0+SB+l8YFK+kyCJU5VB7Pb5V4lz7MpIWNjeKpq
         liDzBKR7s4G94EjPTl5Nc370rryXebMU2UWRcCCAvWZ798g933ZB6+RUEYXi63xoOKEk
         jLC1w0Ra6XLfwROLfWNAULgo1EAXp9y+j7Oxvcr0CLkX7g2bFJCjReC8UYMpuQVjN5/6
         I1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779715086; x=1780319886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ybURYAZAK09wyFO+bp7VbLScJXcQAPWGCyuQwes617Y=;
        b=FISQeXmOuyhdf355FBWGa+db6NQQuk7yZQdHRPCl02LDCZvuK8h/6lYX/Bs/cwUgoV
         9MardlukH+lRCuIU0XuRRIRXXaiogRjV9kxmjvbndsm8gKKqFR7M08UlZhD/x/tSLbDQ
         MBD2evWvmk2lMnAUfXT4Gjery6wvsrg6pM74R6EIRtGT6MRE41Hxnd+G5VrnWBJETuuM
         jIiSxNbn5XcqkV22yIESu4dumdCFEN7gP5raGe6SRdPw9t8JzKltoknaHmnT1KonpPQD
         gisKAM99vwkFOgYOjQR/dq+JMi8wzJkQkEVCIihr/P4ZpXBdanahZwn2IFc6eBiJgGPO
         1jmA==
X-Gm-Message-State: AOJu0YwSlQnaHW+xEN7Yl3pT5GbVucJEjTQPnjkKPY96Hl4etqQ92HBm
	F+2bBOYCs/liYA8Um7hTDsxGbYQFIKdVM92mbeZozELe2ladYc8LUCLsNOucMPi1kjRgrv0H1We
	DgLekM85dxp/LRcCrdBudBoETjs3GC5LqbiY+2A4V6bAxc4Mc/+EQJrjxIHoA8VCxTW4G
X-Gm-Gg: Acq92OGkT4rznH4dYZ0Qz1p/z+eIH5e1FKwf9ImavejJKGdKcCsd5Gz7WSaF0kaZGP3
	gAIV4zdtqgXnG1+/tHpwLxBGk8TZ0USvYig8vvdbBbW5pI5u3TJ0ka1ThKYI+klBsMLbPyKwnor
	KfvbFipu3cobXKU9k3gplbAcsp1rFJJBJ8dszD4vY/+yI1DIVjA5KaTXfm5wT7EsSDNn24AIab5
	gfWjCaCSasQ/PpzQiceGzLfojRzKzXTxloYaj95n5MN8em2MuMvGIhDhlmbQH2yYhdGsBvXrWfE
	ZT7NtIW/+dl3eGGyq8j+kcur0CsPAIMl3Lyqe0pvI/Ctn1RH811p58sAggJ9YQyL9eN91QNE1Tk
	EQbvkawOxKHP0mjNqcS6pXHVtzP2aGJ4geFpq1vaSD9aLjA==
X-Received: by 2002:a05:620a:6485:b0:912:4e97:5e63 with SMTP id af79cd13be357-914b48c09bamr1312633085a.2.1779715085682;
        Mon, 25 May 2026 06:18:05 -0700 (PDT)
X-Received: by 2002:a05:620a:6485:b0:912:4e97:5e63 with SMTP id af79cd13be357-914b48c09bamr1312627485a.2.1779715085062;
        Mon, 25 May 2026 06:18:05 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9f50364sm4126356a12.8.2026.05.25.06.17.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 06:18:03 -0700 (PDT)
Message-ID: <7d61b15c-b303-4b66-973f-b30d2314229b@oss.qualcomm.com>
Date: Mon, 25 May 2026 15:17:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: Add Shikra EVK boards
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>
References: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
 <20260522-shikra-dt-v3-5-80ffde8a3dc4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522-shikra-dt-v3-5-80ffde8a3dc4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a144c0e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=ljmfqE2-A84B0niWMNwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: dvFKO1jxkBYySoHYesUuCUpgU7AC6klu
X-Proofpoint-GUID: dvFKO1jxkBYySoHYesUuCUpgU7AC6klu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzNyBTYWx0ZWRfXyQ4cARCrT0qa
 vwrUZPKfBPWTW0CHnFHmaPg03P0VhASF/s95xQllp0ueeNzKtGGaQt3Yn1lOJhVjYnw7YHKGEc9
 Q9FpmauEFTI/q3kzrLLpK7lME2EJ+ajtUh4hQTLmnO1mUsKFhBvSta0f39MveEjsCLDHFnV5YQw
 jx1uzGKXhTQGWuTiycfc76Spnhs033tbZrEUvkzWvwIBzlDzsPUYt8EAcpW3dVdmk4UDV3S/0NN
 peiEQkZWgQdBZv4wn2oF5/w01/wuRslCjb4jJ9/gqVQXl4/Ax7GLN2uWOIZkGVz5OTcTXk+0Ybi
 04r8FEk3k7De45eXb2exfFQhg7WfWZvqCkHev7lo86g4x9CcbHmstWNTOCeilhIpSsrRuQvgd6M
 4FXkBimqkcWXkD69kCLOWNb2NK7TkbRuFYyxVnM0ZsT3Q6Y7QlMuLX2OjjMPPIGU0sJswh1BX8P
 UBj3H/5cP9d1OiU7Pbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250137
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109663-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,quicinc.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 935295CB0E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/26 8:02 PM, Komal Bajaj wrote:
> Add device trees for the Shikra EVK platform, which combines each
> of Shikra SoM variant with a common carrier board.
> 
> Three EVK boards are introduced:
>   - shikra-cqm-evk.dts: pairs with CQ2390M SoM (retail, with modem)
>   - shikra-cqs-evk.dts: pairs with CQ2390S SoM (retail, without modem)
>   - shikra-iqs-evk.dts: pairs with IQ2390S SoM (industrial, without modem)
> 
> Also add shikra-evk.dtsi, it represents the common carrier-board and
> daughter-card configuration shared across all Shikra EVK variants.
> 
> Co-developed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Co-developed-by: Xueyao An <xueyao.an@oss.qualcomm.com>
> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

[...]

> +&qupv3_0 {
> +	firmware-name = "qcom/shikra/qupv3fw.elf";
> +	status = "okay";

nit: let's add a \n before 'status'


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

