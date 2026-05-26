Return-Path: <linux-arm-msm+bounces-109911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPQVHUPeFWqCdgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:54:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C24675DAFCF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5794430144E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AAB7421880;
	Tue, 26 May 2026 17:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RecqjBb0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HzyztGem"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC1F413D6F
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779818046; cv=none; b=oV/RRrSF/5uvZmIrW5KwmvMTVpnE0SNvCekQj9jebtM3ZGY/YxlI0INQp/+IDuXEclpMJa64eUV9q9QKhGISmAyRaJTJY83vHvNrqOYA7b+Xdts/JejYsdyqHq9Jg5Y5g/zRtFgzCDNbQmBr4cUhjPV/3qg4qGht252fipFnPDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779818046; c=relaxed/simple;
	bh=jIBKopzmpHv0w8uCdxC2/k18CuB3MASrGF15TQDIKaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZN7nlj9mpDWqpSSue4TTwvGX0dGsaEZQZDSbHqm+S0kQIHN5XDawvtEyBOIIt1hhwxgCJ0B/qbVFJTkjbD94Ymyefl6Zl/CTodAIIXYkwiYBkMhgJTVkFf6iL29cm8hQ4C52RwT1UnSQLGiZi0JrLgkLpOp83HUGWLH9+wLlLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RecqjBb0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HzyztGem; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QHCmZU3314412
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8S8qWwQdbAdjsWRCa7jWdqeaaseqcCjBVK19LWrjVdM=; b=RecqjBb04Od9XmDb
	DYjVgt+xSgwnt2wRqJlUYJaWErffzHgBC5M2ZCExU3B8KOpYwzAGXhK4nXfqM4/5
	jUoVvFCo02sRfm6f3aM9b3z4yjAjmLvDCm37sYj+8iIkBwQsj69kWusPP81XWgaq
	JTKK5TFEzspb5nNvaBn/WxeR2hSyO3CpQINVQ2dl0+7jIhbdGNOOByeA3ZKXy1e2
	DQAOBv4ElWc+PfE5763vDBxlWWd3afBSr7uocny9uj92Lg9xkWYNCyYZgjdf6yNZ
	7aMJLnijfvL5KI1ZNUrl62N+09PT6Yb+IS4XmrAcBpnE8qgO/iSyxH9JfsLgm0gZ
	T407xQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edfqk05kv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:54:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c82c4772950so5448300a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779818044; x=1780422844; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8S8qWwQdbAdjsWRCa7jWdqeaaseqcCjBVK19LWrjVdM=;
        b=HzyztGemeVDq9XXT5daDbpO8MfD05DNI/U2TxqWhAkvDmBPnTFThtd4J3gwgT/H7gD
         IaCQwtq8S7aE8hArC4eJvgPofiUyLLsVcIW8JtlXOL2EVnn9vgRSFJpEKsK3kxWMS6Bp
         MSPeSsPTXeIuODNnGKWbqq9Uvw+sAv1sZCA3u3MmyJTyjWmu7I81E697OUIW7zUjf5OI
         IlKQIYBCcD3HS00zWHzAldq5A7kMg+tPhgBXrHWQvqR4sHpA3WR4pS3Fn3E8MnjqeV47
         eExexf2vVXAkfwCVy2iYlzDJc2hKYQzvt6ImHwrGJDGdvVg3Pi7oCH0YQyYzVo7Bmr8p
         W5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818044; x=1780422844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8S8qWwQdbAdjsWRCa7jWdqeaaseqcCjBVK19LWrjVdM=;
        b=sRxKMsFCV6/HLBUAqG15pUTcQzhFk67IMNp4wLhpwvH835oY+yV3QuzpGAfGwjWaJz
         PAuh+S/+yv7CFqZ8rGK1uipstURbdDte2fCeHrGg7P8vYo9NTkDaYaYZLiXCrphFuAVu
         2HBpenVC/IFSfQxqRmvxeppM7y4kX9aJMGAy4XvV7V1bRiFoL8P/asDujDGrgdRww0fV
         ARt9kFuLoiCO4vKHAHJY5+EK7GyRrtwHqauXmrtM7zD73RZETDmbv9drdEBYHrYMbOge
         r93gK+9ktz4iCCJBHdZVUlgLukxsQM+zn47myhSDMOit9Uf9smVZ3BiIG/WHS5WD/nSg
         /Utg==
X-Forwarded-Encrypted: i=1; AFNElJ+1BiTUtvfwY6kekXjVTEjNh33OOrOLFdekxuRbi1JNHpvFP9WddQv0bMuPxLgZJihMisV5g4TFgQBVNhDU@vger.kernel.org
X-Gm-Message-State: AOJu0YzQV+ysZZ80rlTKchEntFSfjoCnq8zfqxFFSooIqbsl3mYZ7vQh
	719B44es2lIBQnFI5E+Pi/25FDgwuOGqBcgqaQZb8zaokLOSAOi4XEwb7Qe1hSnpW8OCJjgIU2f
	pcDIWbIGWV2CfCWhR5yUjLSWkggnUaCBL8VxistVGsQL72eWSC1oprLD88+7+GCTHIIk2
X-Gm-Gg: Acq92OE4Hna1VzA+Ywk2NdhG8ILE0whl1TTAiIm6WkH/YeHm9RbuTm8tbO0a9UU7vYv
	Nf70BdJuVubzUw0G9ck/m/1aNrwL5AA3ze2hyRNCM9t7AhK8WsA4JLQNb+QzdL2u9h1TmRnJI77
	qg9JFAu3qnXaXhfE0QceereW3zMVZ8dyBTw3k2lmBix05CzKD4LmO6HpOZkF6sBvMjdJyTS0uQe
	/mDjHwZelxPWBGm0CFjwME2uHGA9LNO50Hwoii6otG5uI22tKtSsCpLVJdMMrW2q8vsnrXnHjyr
	NvFqvQCKci1CIGiTwEMpy+Gz5+BxPz30/iiH8AR69U1IddcailNY0x0L7n5bjsYKNr46fGrTNob
	0lm/lJLgHmqbkBikISSFr9eg+BgD6Rzw0XisYIP8TCRi3HUyvtNEH
X-Received: by 2002:a05:6a00:4407:b0:82f:1f43:7190 with SMTP id d2e1a72fcca58-8414b3e1e94mr18278011b3a.3.1779818043829;
        Tue, 26 May 2026 10:54:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:4407:b0:82f:1f43:7190 with SMTP id d2e1a72fcca58-8414b3e1e94mr18277991b3a.3.1779818043317;
        Tue, 26 May 2026 10:54:03 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.233.223])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9a42sm15138298b3a.8.2026.05.26.10.53.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 10:54:02 -0700 (PDT)
Message-ID: <83fe4b80-f40b-4f74-8faf-1c6268e79648@oss.qualcomm.com>
Date: Tue, 26 May 2026 23:23:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Shikra
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501-shikra-tcsr-binding-v1-1-0c136d193634@oss.qualcomm.com>
 <20260504-pastoral-devout-jackdaw-b84ff6@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260504-pastoral-devout-jackdaw-b84ff6@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fqPsol4f c=1 sm=1 tr=0 ts=6a15de3c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xYyWL/Q2DZNEK6BS9gpG/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KU9BRIzEWep4G3HigKMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: jf2h_C0pUR-WbMy9__wbaRPpoO3fcUkH
X-Proofpoint-GUID: jf2h_C0pUR-WbMy9__wbaRPpoO3fcUkH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE1NiBTYWx0ZWRfX4EUuoik1dw0l
 lRtut3L8k/JHYkPDSOQ+x/O32JGzLMsgo1doV+dlRYpeB3Aq/jkoY+wnJ9/7fpxt1Jcs7gAiwK1
 QI1KttCzjXBhH6UI33YdfwxwTxBfen6h6kd8vyrVPd00NmKLcMhQ4lmCk8yrybErvvfQ1nAFqKR
 TwUlPpj6Nsau651Sym21/OSRLQTpSSSjthgwUuiYZNWNtxrg3fhETfRQAtlgmdpP0TnVpYvdWiR
 x9PPAgoPUcWA/z1/iMpmEqbufJz60/qz4zmxDOpjezerI+h8scDoR74+s20m6PpkquWZhsIVDwX
 7XuZsftHohoogv/wpRSu2FqDb81Uu+/SYLEHaIt9RtYj48/iHjUe2sBvWroaqgSwNLhEbgk3lzn
 AcEm2ZEDZNWPIbWtcdQL2gTGUWoWLkeH7PSeN6IdBUtjf4fnvYR+5D6xUcTc+1NHx0j9cSsnEl/
 L3FsSIDqslDaSqgHJkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260156
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109911-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C24675DAFCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/4/2026 4:37 PM, Krzysztof Kozlowski wrote:
> On Fri, May 01, 2026 at 11:31:17PM +0530, Komal Bajaj wrote:
>> Document the qcom,shikra-tcsr compatible.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>>   1 file changed, 1 insertion(+)
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Gentle ping — patches have Reviewed-by.

Thanks
Komal

