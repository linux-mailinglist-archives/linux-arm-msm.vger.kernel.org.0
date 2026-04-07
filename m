Return-Path: <linux-arm-msm+bounces-102091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJy6FHLP1GmtxgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:33:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 501043AC10B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 78DD4301259E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 09:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0C43A6EFB;
	Tue,  7 Apr 2026 09:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EOgsPHmh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g2pYsZQD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C4A3A6B62
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 09:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554345; cv=none; b=naik+HZ+O2Ho4PdGcZHR/f6kVWkW45uIB02FvsicgHP21UVv4mZtImKRDnbStjUKyG4E05llWzLfJlXBSle1FwjkSo5tjUUE5daReHzv29ViGnmyNycdeJf52+PZtvXj8DZwvwmLQt/c3DiUQZJRNoMNDUMgCMYWOzoVQ/L28VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554345; c=relaxed/simple;
	bh=3FYqamKMrS6MmNVhAXadCHdnNiqUke0+tYR1xo8s8pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YJ75VjARSmjYLnMKabrvUZWOUMPiJQSycg5zKf/nfDgakqyy+UJEwFq9I+bnK82HmW93BorfLTPaWK47e6VrgJul6LOLisGFGgRhAFWmvCYB9UEelcUxlVFHYBibwZoUMEAV9tY6O1H8g9mvCLZGtF7b8aRoneR/rrlqfVTDd+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EOgsPHmh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g2pYsZQD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376Wjd53402384
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 09:32:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f4X4jgjHKZ+9UvPA3i8Sct9L6+UDMLDHTXqdlnuxTOA=; b=EOgsPHmhJNIdu2hB
	Bm02ClVG+5QjDrkpIxEEjtzGJvVPRfjaSnTNdGW6cFElb37GE9XGshbo1aJRSkXI
	9SSGJk0X8B3TQaNY9/a/xFQRglL5iGhpTBVJZKPr3Ghinyh+wNhfJ0Ct130810Go
	uKCad0zzAxIFAXA2519giHgsS8rmioq/7KVgBOT6QXrs3XTcC9RiN2RW0g3GkNvV
	u6XlO86BqvTlwM0DgjoB1dfm8tqI+LRBUAq2jOQg8G+fjCx57Y532cKqFjZhgc0F
	LEdtQFAdHgdfeZXM/aJbFF8aazHs42ibD9mDZPZ44onjgv8fGIWjimSyYe33QGIt
	zicLTg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrht217-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 09:32:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b33a19837so18297541cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 02:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554340; x=1776159140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f4X4jgjHKZ+9UvPA3i8Sct9L6+UDMLDHTXqdlnuxTOA=;
        b=g2pYsZQDRGuehTGb/djFnZuRd4F0pkokz9Cw4l70jIIOA4I3TSOgEHoyPBIZr9Z1Vz
         /76dOfqBf2x9zB3rNSwYUWJr019XZliDhN17nCqK+fC2zT9Wni1bRHXkoJ6Fh1CP7hQG
         4CgdrOTFHu3fL/+C7l2TJu7ABms+Hk6eIMlC7HJP87jat+Ga/DMqDSzUmEQ2MDARG2dd
         f5FwReAIUSUGoIVeZ6K0c2lCZE24KWIPBfVEelMiOslpFyvQAfBzcgzkCV04IA69OTiT
         J+raDxg43Cpgd0FO5CO6SqoRowk68GWdkJ7+SK1V8bqE5Y4bX/sthhChqbtnxt7nStXM
         D0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554340; x=1776159140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4X4jgjHKZ+9UvPA3i8Sct9L6+UDMLDHTXqdlnuxTOA=;
        b=HDAswkn8kahHB9swxp/uq8pqV1DJKxlGDaCDMEwGLpE9RaC6rgnGE63nWmxlaEE29n
         3uBRBvdPimcJLh3MKDrtYBax8yfO0IhsnX7KkCGIzYO9ZTj8Ri0DRmlcw76ALJf4ygjH
         hVjNaWefvQFwQVtD8K/wZBSnRBK0G+OWQDYNE5r8MT08L0s7C3JVZB0abfv13vlaFOgX
         IBKuJHxjQiCPmWRkKUU27LVpxB+YBo/FrOFBF78hIWK6V1+Gl/KCl0nNUol+hujdTMDK
         T9/0y53bqlIe1POyUx4idXlMey4QL5cadEU5XIAuRWrQX9mWHHFal4xNwXu//Gn6oHsX
         Bc/g==
X-Gm-Message-State: AOJu0YxLK7G8ityMmr3zJWlh9FrEk5F4yOhdjT/+9w+jx0OdpyTzRViR
	inpJRXyf5JRAfkrbpQRnTYdtj9BFf5qYAsCA+R7eBxSiY8h91a9GJk0VF9LW48KTickkdnVLUOb
	nt/iM+PDV/YoOcmTh6vUEbEsO67lYy9dnKGjXq4RXt9yZMnLp2ww6b3Lh15TG63BBkKW/
X-Gm-Gg: AeBDiesAksJaHHbpZ+n6nkLsAvlQXRWwwGwUYZ3GmFjcvpKxGo1edWSgvExneDXMQzL
	JYE4/98mAucASe26vkQshta5nm7AydC0e1xMm8zNJJrrTFgZ0ZuXfXr8YiJTR6QxjBVAWnE9Mgc
	iEk6aHWlz4U7Sxf350ysSlF/Y+mrAezmpXC9W2wznF1Za/QFAZgZBxdyazLyJ+TfQe7SZqtHdXw
	ZiiVz/GM8AsERwYU7eSOVOqQOHs23sohC6iRuaqicIkDSLk2V38C+bZIlCO/M0zFhno038da5Uh
	VrnSh9j2x1gBJ4VugKFnPMPyyk7SD4Al43/fk8LVQzRP9V5cFTAyGO9tiDIpo8l+T3aAJIxRLH0
	PkVmlxpaFSfiV9aRqvq8HNNit07kdlPSTr4X80OiLX6iDImhRiw0NaHqPi1pFXLlHVJgen3H4zp
	If1jQ=
X-Received: by 2002:a05:622a:988:b0:50d:a978:6ece with SMTP id d75a77b69052e-50da9787155mr4957241cf.1.1775554339694;
        Tue, 07 Apr 2026 02:32:19 -0700 (PDT)
X-Received: by 2002:a05:622a:988:b0:50d:a978:6ece with SMTP id d75a77b69052e-50da9787155mr4956961cf.1.1775554339333;
        Tue, 07 Apr 2026 02:32:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99ec7csm533539066b.14.2026.04.07.02.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 02:32:18 -0700 (PDT)
Message-ID: <4e65c74e-d03b-479e-b9ae-234f1ca1b535@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:32:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: kaanpaali: Add USB support for
 QRD platform
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
References: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
 <20260406174613.3388987-4-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406174613.3388987-4-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4NyBTYWx0ZWRfXydMRAiBOgSpI
 jgRNalOFk7EWeeDRQqYOoCiLLWluxor3gZO3YbZeTQIgW+Bf67k+VD2vjoA3qc6ONgoWbM3ahZ3
 34Ls0Qv7dlc6EIk6O7cxyw6wUsqOWGK5ITw20XDk/nAiTwyoGoLmq6dFnDqlShpTgtjDhAlwA9T
 idssR6ry+1N7PhpPKpjv/y2pSqarxiYVFt4Pl4SgUx5WN/6uwByQRSfZXzNJS70h4pF12VJKUox
 c7oPdz/ouxxMihzg8BbK1q76GDoMWYmpGtO6QqWaQFZB2BKFfKG47AHLYQsuH6IwGLX94HlQWGg
 5BSlkSuW7BWVDBmpXpZq3kmX0CSC4rPPbeJLWi8yX6/xFppC8UZhO9ekESJnMlRNQxT2aWg2RzN
 RPRoq6PmvhBn1x+ukYeBQkXcKFUOh3XNEcyP0rNRq15/WJoiRnvcBCaaPZj13Sjp4nezjNU4Qdp
 0V5tKIwOCknsy0rSGfA==
X-Proofpoint-GUID: 7xwgy74fPiTik5QKhvT_-Srv5svOUmJX
X-Authority-Analysis: v=2.4 cv=XPUAjwhE c=1 sm=1 tr=0 ts=69d4cf24 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=lzcha0RWJE8jdVfZHw0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 7xwgy74fPiTik5QKhvT_-Srv5svOUmJX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070087
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102091-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 501043AC10B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/6/26 7:46 PM, Krishna Kurapati wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Enable USB support on Kaanapali QRD variant. Enable USB controller in
> device mode till glink node is added.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

> +&usb_dp_qmpphy {

nit: the addition of the "_dp_" bit which is absent on other platforms
in the label made the reference unsorted

Konrad

> +	vdda-phy-supply = <&vreg_l1d_1p2>;
> +	vdda-pll-supply = <&vreg_l4f_0p8>;
> +
> +	status = "okay";
> +};

