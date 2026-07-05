Return-Path: <linux-arm-msm+bounces-116527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UC8IK+QYSmo++QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:42:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F1570982F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:42:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BzdQnron;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HIzXATG0;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116527-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116527-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7EA7300AB3E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 08:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A37B536F42B;
	Sun,  5 Jul 2026 08:42:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6C93655E4
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 08:42:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783240927; cv=none; b=bk89JrXeTQLQKKN8Qo3FA5RNApkZACCpIAU/OyJ+tZOQ3gqKmXw36PPm/538+4ai2A/WUEO/Zywi2OAu1kM3iNRy33ko81tILIcCoMTWAb0hLIze6P6PVLhy6qjz48+cBl10J1P4iKxe/18/ZD14h/ldfW7hcpY0O63ifTcAEuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783240927; c=relaxed/simple;
	bh=yKKzPWK+/FdU/VXFVrVaqR48TggYD3+aJAhMO7AVZgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r4WffM26U1JlPCBiwf7zLnrwOtOTRoCHLUhGjhbGsHwK8H7APBriyhl+q19ZDM3+KwgpknBNsVnH1lsOvfcbMi3Rj9gFy+Kl/NTEe+XFjxQr7lPrxXU5jRoUYnLCpXT1g5sj8I2QR/bUO2Ewuqy+3s5pvs69SLrQeNamI4j6Kew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzdQnron; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HIzXATG0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6655t0li904665
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 08:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jdRFpiIhdtARWUSRwfBjeoXMFG+E8udRGzwOjsDHjWE=; b=BzdQnronpobP/+PA
	rGJLRm8/7KNZWXdLhsyatKyJxOoP+UY+lMquekjgVL5zF+S2PJnI+zsZjZn/GMNK
	lWUnJTYSIdUrm3ynSa3H8b+kipiEb4iiDB/XGpNV4iqRwE5k+VLs6MrfK7vOFs7C
	iFRszOuISJZRGk0OFpc9I1v8c/HymomUA07PKGfjGrDTS6ZnAiBuDnDOlx1NF9Fi
	Xo7lUgAtrB08D49SE8saY1WEBuT1asv40kO5yJNi5/6WGdK8UogvDtgWIQY7ePBB
	MnA8sLXibyGsTJ3ygDu89NdxxkkbcveFDqoSRb45U0MzYv/FBQRUevvav2jwAAnw
	a000UQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvjdr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 08:42:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37e24235ce1so2798158a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 01:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783240924; x=1783845724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jdRFpiIhdtARWUSRwfBjeoXMFG+E8udRGzwOjsDHjWE=;
        b=HIzXATG0tKDX0xGhSYs2pHyW3rmdvmxAAt+fC4LGjL7IabAlD4Y/4lXMyZAym5dCYl
         crDy1mMwuOXfc+MG+ICBXLK9tIYJ7az0hEhdlTeA+owDqC666cyckRf95BJxLfsWHPBy
         eupOEuKbxBqCrb3Jsso+BE0HsmvodBST3XSxoO0DZn0Ag5XMbCp8mD1Z+ngroXsTYMAc
         DyOlHBs8lQYnYvzY04NSoW3qzGcnQMv/R3BmYYKUS390c1hV3Q3ftaIpnpSxt7egmclk
         zyF9vG012fujPCTHSqn5AZG3diUNUVDSjgj/gZRtWj5WV8On3IV0qrvUCwMM+nX54EAh
         KSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783240924; x=1783845724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jdRFpiIhdtARWUSRwfBjeoXMFG+E8udRGzwOjsDHjWE=;
        b=eKKQYdfV4TlE7A6PqylxMec2dpTDGh1gE/D02GwPH7Gliv2FZ/9PbVfEnKx2vJhUp9
         7gRRixo0pW/yOLdRc313gaUmbzg9u8C1iERbSsoU0VIpMUkRyDkCHhAn3A6WEcImzgGq
         1rL+SbJO21FJmSz64Bb945C0R0Bf1/IVL41xSHy9MWAli4BbyFZH38KcDtDtL0Ax789l
         S4aLgdjsj76zLHXB8i0INzCXU3kZas9XGLussIsFxBM382XyYrz+doz/mmFastquzcNR
         ASqGl5HNyfdPaQXb/o8gamf0J7LZbziJTw/cu+N+pk1dV3j8Io1C6yLV1E7bAgZRXcVJ
         A8pQ==
X-Forwarded-Encrypted: i=1; AHgh+RreRj1rnRHl3tg+YAHnd0wGhry3bsf1jihArdzkrC+KUCzOlPhhpHM1wQjwxzv50VGCbz9m/e4QZmQht4hx@vger.kernel.org
X-Gm-Message-State: AOJu0YzxPv4kecEkt1S/HnD3SKtUPlfdv4+9iek+wdalUaJbYQs0g1bi
	PVftqWEQ9LehfHaJonU311LS5Wvf0d4mxpPmFfthyARrkxw6GL/abCSeALhzkqD82MsDe2T84g8
	xBaCngg4jdOwXBbB/YGT1YyWIWLL2ni6ICXdiV84FvmUSZPppsxaHqmuK8N3g5l8Z3ET0
X-Gm-Gg: AfdE7cm5VAPaGPGMgowdvhn32SIKdd47RffD4I3sfs0WJe3s6VwyrAOo2+UwgADgZS3
	7XulGvVVN2UA+whOqkAS0P1gmf75dCGsNjuDnv33uLpVpXhcuSFtkMSnlBfPfVkl/T/ulkTMHcx
	r8L+QXOoWLWA3TH9FsPt55pHCJ2+liA+VyPuAVWeRgJISRDq+P7TNuecL9bCRYiuNLeZ3KNvVZZ
	SekeduVlIx8Dxlc+4CNutvwLVm9eKE01ZPOsaiZyv4MJ/DVYCyDlhO44Irb2NWc0kDeEfdz2O3p
	N6RbdTZdXbxokKdIqOIW3fJL49D+O/mrSDelOxgsceMlA3vUgrmgexaYgCvSYb5cIYIELVo6Ibl
	2hiB/sKtsnmLV3WTSJ24Gzzihwep4OYmf4IlVTYJpUg==
X-Received: by 2002:a17:90a:dfc8:b0:37f:9ce1:cdb0 with SMTP id 98e67ed59e1d1-3829f9dffe0mr5138254a91.30.1783240924026;
        Sun, 05 Jul 2026 01:42:04 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc8:b0:37f:9ce1:cdb0 with SMTP id 98e67ed59e1d1-3829f9dffe0mr5138234a91.30.1783240923435;
        Sun, 05 Jul 2026 01:42:03 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7bb8fasm38382008eec.1.2026.07.05.01.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 01:42:02 -0700 (PDT)
Message-ID: <9821302b-5e14-4a8e-8b1c-f3eb1824d7a3@oss.qualcomm.com>
Date: Sun, 5 Jul 2026 14:11:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] dt-bindings: remoteproc: qcom,pas: add
 #cooling-cells property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-2-3882189c1f83@oss.qualcomm.com>
 <20260703-quirky-impartial-oyster-caab0d@quoll>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260703-quirky-impartial-oyster-caab0d@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4a18dd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JaHktJlP2QtFIg7UHuVw+g==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=V7JA6PPGWL3xxjczixMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: u5hXKqDWdA8zGt_IznNm5RM36g5xhqeL
X-Proofpoint-GUID: u5hXKqDWdA8zGt_IznNm5RM36g5xhqeL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4OCBTYWx0ZWRfX//exnPafH5i3
 cqpXQs/9vie5vVH7AyGGb1D1Tprbd7HkeSCgEqDcJ0TuzMw9M4KbU9sssaFuTJ+txpzvB1hXk7V
 ylfSoiv2BW8oRUvSgzpds+47cFIiht6MNG4JVPFzqchn9QJAGBJu1AjRB23jrJ0Qk2ldVnERGhR
 oXr9N5i5cNVsNo/HaYOtFWYc7mp3kuxGoBkKeUVU5mW2iLFiJ00ndqSer/fV/Jc6bcLI5LAHEP2
 Z6C/6zhss/pneA4e8yzLq6ZS0gx3M+yEdubvaqIYj64R1l8Oz/yFIpG8iXtZU0cwDh/2W3UFR+x
 XiUy0a3vXgLfiXbOvy0a5e6i0decAjV/z3/+FHNcH49EFTsAedEFksmIguTMu2lRmpWH84a/LVd
 4t4DvVDaFlhXpprjVxosaVZVyRNMRJ4BQpsls7O1nESSubfJSKDYohCkSHSiP8YS1s1MU1KGxn4
 gaalN38XBzgdJlJQ9oQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4OCBTYWx0ZWRfXyW3OhXJRlNHy
 kPItaKGO8pjvL6hetz8MvoYeI9J2z2BuBLjEiUcsXGWzU+rz+LxzVThW0Htx4jZmXdjgpqCfeSg
 ZfiwihKAenbo2iKugklWjbvF8JAGYE8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050088
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
	TAGGED_FROM(0.00)[bounces-116527-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 00F1570982F



On 7/3/2026 1:19 PM, Krzysztof Kozlowski wrote:
> On Fri, Jul 03, 2026 at 10:33:05AM +0530, Gaurav Kohli wrote:
>> Document the optional #cooling-cells property for Qualcomm PAS
>> remoteproc nodes so they can be used as thermal cooling devices via
>> the QMI Thermal Mitigation Device (TMD) interface.
>>
>> Qualcomm remote processors expose TMD endpoints that support thermal
>> throttling through firmware. The cooling-device specifier uses 3 cells:
>>
>>    <&phandle device_id min_state max_state>
>>
>> where device_index selects the TMD endpoint (for example PA, modem,
>> or CDSP software mitigation), with constants defined in:
>> - dt-bindings/firmware/qcom,qmi-tmd.h
> 
> Full path.
> 
>>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   .../bindings/remoteproc/qcom,pas-common.yaml       | 39 ++++++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> index 4607b459131b..ef11371058c4 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> @@ -79,6 +79,14 @@ properties:
>>         channels and devices related to the ADSP.
>>       unevaluatedProperties: false
>>   
>> +  '#cooling-cells':
>> +    description: |
>> +      Cooling device with three cells:
>> +        Cell 0: Cooling device id
> 
> And here you provide full path with device IDs.

thanks for review, will update this.

> 
>> +        Cell 1: Minimum cooling state
>> +        Cell 2: Maximum cooling state
>> +    const: 3
>> +
>>     glink-edge:
>>       $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
>>       description:
>> @@ -95,3 +103,34 @@ required:
>>     - qcom,smem-state-names
>>   
>>   additionalProperties: true
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/thermal/thermal.h>
>> +    #include <dt-bindings/firmware/qcom,qmi-tmd.h>
>> +
>> +    remoteproc: remoteproc {
>> +      #cooling-cells = <3>;
>> +    };
> 
> Drop, empty node.
> 

Ack, will remove this.

>> +
>> +    thermal-zones {
>> +      subsystem-thermal {
>> +        thermal-sensors = <&tsens 0>;
>> +
>> +        trips {
>> +          alert: alert {
>> +            temperature = <95000>;
>> +            hysteresis = <2000>;
>> +            type = "passive";
>> +          };
>> +        };
>> +
>> +        cooling-maps {
>> +          map0 {
>> +            trip = <&alert>;
>> +            cooling-device = <&remoteproc QCOM_CDSP_TMD_CDSP_SW
>> +                             THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +          };
>> +        };
>> +      };
>> +    };
> 
> thermal-zones are not relevant to remoteproc.
> 

Ack, wanted to show by example, can i use commit message for that.

> Entire example feels pointless - how is schema even applied/matched
> against it?
> 
> Best regards,
> Krzysztof
> 


