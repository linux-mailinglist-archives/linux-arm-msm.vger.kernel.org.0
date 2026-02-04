Return-Path: <linux-arm-msm+bounces-91781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJbzAdsPg2kPhQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 10:22:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 588E1E3C5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 10:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4244301D338
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 09:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B113A1E62;
	Wed,  4 Feb 2026 09:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KjzRniTt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PH+mjuiY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B531367F24
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 09:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770196859; cv=none; b=QpmHw0RADfvow3aKhEmLqhNKPc4RgReuoap/SN2hMBrgXNFY9+Fah5fS22bYywKOxtNoVYI1WPWe/uxuiVhyfpZAW8YoJETIaVX5FgBrnxDDd9C25iSNtGCqFGO5g/QMhIgOc/yW+VjIiAqa3jtF5Vjc5GVV+Ot/Vri5nqEfxVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770196859; c=relaxed/simple;
	bh=7YvrdqUDlR24LmyJLV4Vg39tDMCwug3DrUoUNwtSQDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FwjGgO5UPnUNZh9Jp7Sq/P+TawAjYzh0GAxcwMg8MBUb1d4pPY3kgF8R/fIrzLobHbLDRNp8nL/qDjUTFM4KGYvNNnNMNCHeeL68rusVYxoBplX+/ExdPJM6KBrMMnlEwAZ1VxPTXCkpEuG52vHUbGT5xo95selypwe6WkbEwUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjzRniTt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PH+mjuiY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6147EbiW060339
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 09:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H//ePA/h9m007LDvCo0xnGwluqpWz2874IfBGF/gZTM=; b=KjzRniTt0byMD6TM
	U/hP6XEFkh45OJtRdyb65aoyly7hYNlltoPr1/MROnjo7TOfVPQaNEtGZ2zPUj3W
	SKIyFucVe9p/omDjvyMx0tOa76oJwsvzseLlMzn/PlQsoKyqB/2DPh5JLFCgM75N
	N4/LEIABeXM8cdr+bZehdZQ8eITyYEDgZx8p/QuFxP6lUD3AURZ0Q9F+1P5J6x62
	4ZKhm/4KSQzTOci5DF6XZ9xeXgzcIirP3hqsYvqPqkegIF8T2Kl/vWjG8g+HUpOA
	qCYtfAogm4OA6ULyuNrJTjp+7EGMbZrP/iBgqcZ2lAzl7KBfd2rWLv0Lt3IFpNHB
	Z3xB6Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3nf62pxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 09:20:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a182d4e1so128133385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 01:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770196857; x=1770801657; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H//ePA/h9m007LDvCo0xnGwluqpWz2874IfBGF/gZTM=;
        b=PH+mjuiYLSdEge9kAbVCr2Q2xBRSwxrQcw+ZUqttZkzpLL6mV8e1/eDyIxTcCJsXTX
         4c/t0t0uk3KDbQpvLxDmZFnFvzeEaRqZxFeWujr7t2ZUVwvIKfNjhtnXefQXBdPFMpon
         y6Jwry5dXL0bMqoLRPef64XGIGKJz0E9Arj+qi+IS6FMXIHzqQLfiHbFJobR70cpihzg
         GQVDCiraZJetJQ1gzGYfhOgogUrideZTQpuxobHLstjMh7zxaWC4ECeTqKiZtQICvY3o
         navNJXVZVAlt0kuCnya/h+RkDWiemtlLCV6cttLQ9MxDIvKoemtZWumed25mAlyKv/5g
         axLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770196857; x=1770801657;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H//ePA/h9m007LDvCo0xnGwluqpWz2874IfBGF/gZTM=;
        b=LIzwCBeB9JQk6RRhWQrH1vliGmcxGjpMfMo+iSBPcGQvhwsqoH1QKjaAqEWlq+tXeo
         OQfH754aOOfNqMXxv1B4IWA5B1adijjbeEcmxDXGh0JcPeKzX5Tgr5pyp4QzyUeXf5i3
         B/3BpXPC8Grj18lCwGdOJAv76SEdAXGG24dNWrH5OmQvi6LD0rLPdbemM7G0e0QlyiXi
         lOx3DH7il1l5i4bOX0+0N56JJcu6j0WLapEs/IBYRJi7ljQUkpcS/10QMcESwyMa6U7P
         7R3htfqy9k6Ys1Oam9noUaBE/NntIrN51TfX+nhju6LNTphRnyzF22136TS5laTuWcH+
         zNvw==
X-Gm-Message-State: AOJu0Yx7G+/27zo3V2L+e1H6FRlggrS6GuiKnej0qlk80S3Qep9REifR
	afTnXYdLMK/gQ4YvIXepI8UQGrI92uxfYLEzMmi0BU7MLe3uP16BSvLOUFevcehNOJB7ZZUR1ke
	qxTWs1uf511eGQW08ux+49o/k6soOOChyelPWaX+864eIMpinSeOeyT9p81qEWHuMhkeQ
X-Gm-Gg: AZuq6aIJbFhSPbAUtJsqgzGZ0OCY8aWupwYIwJBM52Nljijpbd68zv3IjA6wnKFRz4c
	U6BnUCPmYmuQcaUcnKaWrdgh38hBKs3zwfTJOmuBtOQ70Ch6LVD60QcB8NB3Ea/tS5iY7sK6Fqe
	QfRWHfm3Bwwt7xlKdBC6sTOPiX+QE1uUhnl1s7AaadGV3lE/HJmaJlDSeV6GRVA49ZVry3rysB1
	PchDT5x49M5fFioct9rXG1sZTpjZEo5VKEcy0LlO3vVFKC+JULpUGQNlxueN7/i5fMoQ0NblPaj
	fSlPSiFgdGGhKFiYKq8cQ5iApXeQnzu022V62hy/mcHh4xQstHqGHkuGTlnl6BpXgKtYyXJ3/aO
	K2/e4UkDJu7R86zrCV4kN3DmPBGoAqcRnMQ4B+Gs8XbfvE1KQaQ57SfcM1/1LYvLHNnw=
X-Received: by 2002:a05:620a:17a4:b0:8c6:a719:d16f with SMTP id af79cd13be357-8ca33067818mr122896085a.4.1770196857238;
        Wed, 04 Feb 2026 01:20:57 -0800 (PST)
X-Received: by 2002:a05:620a:17a4:b0:8c6:a719:d16f with SMTP id af79cd13be357-8ca33067818mr122895285a.4.1770196856872;
        Wed, 04 Feb 2026 01:20:56 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea001d4f5sm109283866b.46.2026.02.04.01.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 01:20:56 -0800 (PST)
Message-ID: <eb9c1489-4496-48b3-8709-739cd45c11b0@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 10:20:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1
 IoT
To: Roger Shimizu <rosh@debian.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <6cd569ad19ae8efb5f4244b3aa185754@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6cd569ad19ae8efb5f4244b3aa185754@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: X3xIbN8FgzDzNMQXLVQaWQJgHkRcticm
X-Proofpoint-ORIG-GUID: X3xIbN8FgzDzNMQXLVQaWQJgHkRcticm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA3MCBTYWx0ZWRfX/oKhYywjmnec
 tsauNwCoTQHqlCaccCjbzT4BIVAUw46p4Nj8KV0a4Qi2tOojt7abMvmIdOuiqB0Bu7Okt3niaa9
 dWnlP8PuxltIR+UtZvWWSQFlbZPD2TZxSBIqe/OUjQKMEEJ2Zs7jHffLi16z8hUZwUi+YxL/UW9
 jt96xqfG/b36RUaXnWLPwqc2Oqi913CRLvXwqQvF93zmiaKySo7xTqqOExn8aDBNliHIklti2a4
 g2U0dIrLQizqgBzXJn9Q7FIzMu3mmiO8DV0ju2CKN+kBVFF2DSjOWZuvG7N98oNI5Zv6iriTj2t
 fkjb8nbJQq/wtYB1zuD/F4iCAGKmwe+j7csx+a6SvT0+lqJqhbtBbdmcqdLeCM2Fi6vXloQSTi6
 9CL8mY167cdwJRFLzDOstQTjQ0nviwzzIPT/tmqanvXHBsDyO4EpJsa7j7CNU1yPYnnUW6vS8AS
 iKRcpA5VoWzh9yUb8vg==
X-Authority-Analysis: v=2.4 cv=doTWylg4 c=1 sm=1 tr=0 ts=69830f79 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=xNf9USuDAAAA:8 a=dqYTYU5wYWLZ_Z6M3m4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_01,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91781-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 588E1E3C5A
X-Rspamd-Action: no action

On 1/31/26 11:31 AM, Roger Shimizu wrote:
> Thundercomm AI MiniPC G1 IoT is single board computer with
> AI capability based on Qualcomm QCS6490 platform.
> 
> This device tree is confirmed to work as below:
> - GPU
> - HDMI output port
> - PCIe M.2 port (for external Wi-Fi or 5G connectivity)
> - UART / serial console port
> - UFS
> - USB Type-C port, with Display Port
> 
> Signed-off-by: Roger Shimizu <rosh@debian.org>
> ---

[...]

> +/ {
> +	model = "Thundercomm AI Mini PC G1 IoT";
> +	compatible = "qcom,sc7280", "qcom,qcm6490";

You need to add a board-specific compatible here, see:

Documentation/devicetree/bindings/arm/qcom.yaml

> +	chassis-type = "embedded";

The allowed values are:

    enum:
      - desktop
      - laptop
      - convertible
      - server
      - all-in-one
      - tablet
      - handset
      - watch
      - embedded
      - television
      - spectacles

I think it's more of a desktop, but a) that's minor and b) you could
argue either way

[...]

> +		vreg_s1b_1p872: smps1 {
> +			regulator-name = "vreg_s1b_1p872";
> +			regulator-min-microvolt = <1840000>;
> +			regulator-max-microvolt = <2040000>;

Have you cross-checked the regulator settings against the original
vendor-provided sw?

[...]

> +&gpu_zap_shader {
> +	firmware-name = "qcom/qcs6490/a660_zap.mbn";

I'm assuming this means the thing can take Qualcomm- (vs OEM-)signed firmware
Could you please confirm that's the case?

[...]

> +&pon_pwrkey {
> +	status = "okay";
> +};

This one is already enabled

Konrad

