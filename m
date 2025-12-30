Return-Path: <linux-arm-msm+bounces-86935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E2ACE924D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 10:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4BB933002068
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 09:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443612773F9;
	Tue, 30 Dec 2025 09:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jy7xA8It";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="baSPipor"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70272737F2
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 09:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767085640; cv=none; b=tQ+YUjnVbniEZtfcbPww6A5Oi5ouDP2cwK/x4xboGpKsuOj7kPRUC3xb7lvA8PeT5Gr4Y36EPeumGsk2/v+m3pQEYWhyh95M18kFYmMpdh8sJbkrJX8/TK/SHn3yCvxBVyCIqfLjCsjJaGW7ktmMXoyoALJZr8aqTdQVwUNgp9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767085640; c=relaxed/simple;
	bh=zfq1eyxsVooAMeImBG6IFCb6YY9Qeqn9UMY7+4KLQHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AF0w2bzhuAB3B0MahphjWfEfdopc2GFP2hMo8LLR9pifu/w0meoAES00nGtLk3MiFgvuf5Bw5E0JUfdXFgpw0TgM9FxSOc20P79DrnXDSJGqaxHuTcFn9BoSeInB+myTd1wtRMoozvCCoG3sqz2id8jeiLOQlFfmuIzkCM/80wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jy7xA8It; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=baSPipor; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU3hgEP2546972
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 09:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dTXohy+irUpcd3Gfqd71DWajddDG5EB5SCs8sOBQ6eA=; b=Jy7xA8It9RoiFevS
	kvPy48KeKNKiltFhRGTSaNr320VDQZ8J9q0pzB7GJygHXFLT5/xErERcyGDvwb1D
	dsKm0i54SyZLGGpTH5hQKwv1GHs024IByIu5ps5Qp8MhJPOsJmAjXbpKSA+8U5cH
	lKsTgVMqfaDIOUjTgv1O5figftYo307Gf7tZG+E8q5S0YUDutuucWjtgxdGvwmH/
	vOeE5kdELmRLHY1CZFhp4QMBCcDze685iiLfbL7HLIRT/j4hko/6zJVuLDrrUwuP
	PtjxVp8hXWXmYlDe+xvSVHydfVdqLzCdyaM9KhDWc0e4Hi4xnuEwfYBH0bNxxNT+
	aoj4vQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7398pe0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 09:07:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a31087af17so194131455ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 01:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767085637; x=1767690437; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dTXohy+irUpcd3Gfqd71DWajddDG5EB5SCs8sOBQ6eA=;
        b=baSPiporAZtoo6p+J4jn+CI78azi/GRbpiDdohumTUE5G6NTbGDc5EtvZGvzOm44DZ
         uyMnJSwulL1HDE49wh9QOA8B1FVSOW4meKmhoexyZYwxTPsVv0pl+TxQHhHrwPtWTXwa
         /BD4xUZiFJ1sd6/5ur1EWgPmhYzAfYN3R7ebKkw4kRdzYZT0Ml2gwIOI73F5VrRBwELz
         UsxsERV5WNM/l3yUPGc+XAH+NR4PAxmgNetJv5EBkNB2JTaHxY1bUVGF1mtPHMZFYQS6
         3f7vSM1HdahieY+TV4a5YcVx6kJ8UxTR4A0UHSmCrA9LfiEM066x7LG1ZlQMkiaCipX6
         UXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767085637; x=1767690437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dTXohy+irUpcd3Gfqd71DWajddDG5EB5SCs8sOBQ6eA=;
        b=XqgX9+Pvom7seO+KKGjZ0Qzug5t2T4fMSd7ERW4iDXE3RbpcJY4lB77cTUFH5WNgA6
         raDfPPKX1Kw0W8G3XLLwcZteNRH3VE51aukb8b+wIR92pazRWwRlEewwZ/DvST8cjfij
         j0iCe6ObYXGcT72L439yoIhuvF/LdAce4mKWGSBO8VJ/+z6Erfz1Ib0SrO3mPnidaoy8
         NUTOfiOrM8oarAa9JehmkH0AkBOv26E1QC3fXqglQhBFjJe3hC77Su9OwN0FHXsXifvx
         rPHUcTWdJNPDBsh/EJA7tBZJ/Soy/lnaltdVSy/nh/GlSCwg0wL9MAd9X6rz5+HsV1bF
         dN1A==
X-Gm-Message-State: AOJu0Yy/anP0iLAmR1XWShx8siKsAVBjFlxUsZ9Byskd837gIbDciZoJ
	lo2xkBUjyL6DdjDwaGag6sgFgdsyMJibQ8GxpcQfUhbniYJe7Uiy0bhpmsQKqvzGOMHXGZ6fU9x
	dSh0SgfhhVqR5Z3LvqhqpQXeefge/GTZ5Uddbt/sBDRJZlNVpAcMSYnmAsaQNpi0umQMm
X-Gm-Gg: AY/fxX6juQhc5r+vYYQtSJbd9ofaBdA1RZEY1fVvjjVAZDU4bo4mAeUfzTxnSw7qV5g
	Mxcigh7QBCH9bbBa2qImxR6nkQ2bm5gjgC2+JwZxgrxBBrsfgH2as9gvXOj6h7pNLhmyMVLi1TH
	wiauLDFDlxvbNT6QXyhG8fOBtcXsl2u2nrD6ow3lwr+MSVLDP8BMFjloDNa+pHfmF+ll5VZgrV6
	SsJZ4Xh0nEnqVB70qAZRlYanXu+WZemnAJShV6nkCO/MTsP+I19NbqRgPRu30fBTjQHJgUNmGAk
	GuhG6AIrtXhu8X//KIVbsoYWe0P93+S72UHcyH8vFk7I/GZUQwRJIy10bcBQ1TzdaBX0/ciNQOn
	eKiQJ7wlO+je4W0MIvMs4I2v2Yp3qe8BIXouriN1zBb2bYmCaAXs=
X-Received: by 2002:a17:902:e785:b0:2a0:b467:a7cf with SMTP id d9443c01a7336-2a2f1f71a56mr303644145ad.0.1767085637253;
        Tue, 30 Dec 2025 01:07:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6XImN4KSFStkKAcNcJ17xwNN80501uVV4sZa67kl35qoIIEyl2/FUSFpkPjlHz3ujxp5wCw==
X-Received: by 2002:a17:902:e785:b0:2a0:b467:a7cf with SMTP id d9443c01a7336-2a2f1f71a56mr303643905ad.0.1767085636726;
        Tue, 30 Dec 2025 01:07:16 -0800 (PST)
Received: from [10.217.216.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66629sm297173995ad.14.2025.12.30.01.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 01:07:15 -0800 (PST)
Message-ID: <37253691-f164-4aa3-9199-4b21e9847349@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 14:37:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/4] scsi: ufs: phy: dt-bindings: Add QMP UFS PHY
 compatible for Hamoa
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, vkoul@kernel.org,
        neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, martin.petersen@oracle.com, andersson@kernel.org,
        konradybcio@kernel.org, taniya.das@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
References: <20251229060642.2807165-1-pradeep.pragallapati@oss.qualcomm.com>
 <20251229060642.2807165-2-pradeep.pragallapati@oss.qualcomm.com>
 <5c97bac1-d796-4046-9450-65cc99ef7469@oss.qualcomm.com>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <5c97bac1-d796-4046-9450-65cc99ef7469@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2AvKhpgi5RBgu65Zh-XVDS4KTEWs48IU
X-Authority-Analysis: v=2.4 cv=HrV72kTS c=1 sm=1 tr=0 ts=69539645 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=N2xpj-L3_XMPhEp0_2UA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA4MSBTYWx0ZWRfX5XBwaiML1hpw
 iJwTCbVz2KQjiOtdX+swKtAZpOtHVRSZ3q/6p8R1sFz8GN2nVdpvbycNG8XTy02zKAmbOkOKEvJ
 /T173JnAlmd5QEVzpT8nmiLBbECmcghty1XVuEe3yeOd2zN+XqrGu44SMOV6zIdupQCDLxZ70Fk
 Dl9BwBR6j1fCi8yxVYH8Lmz7UZfX3TeZLb6xKcbPTIUz6NfAVBfyb3sk6KKZ2s5TLSV34IBEy4x
 v1kBGZ0srOIKeaocKgq5lXosUxa/qz5gA0EgodayfaERVXvtrTQAJKjVOiff9V1uShPyU45HwYx
 fTgPmPfZvXrHmo35EysgkDRTpYsLU0MqUXsweyZMfgfehAUdRz8mGiFfmhkTMRp53iOBgHEV3ky
 91Z7cRYc4D9AQMtIskeGxVpUHYhPTlL3FSmp084H4JseSApO1RUMAD5EU82bModLiEeZRXLjAzl
 zGMDNhKu+yZiHHe1xnQ==
X-Proofpoint-ORIG-GUID: 2AvKhpgi5RBgu65Zh-XVDS4KTEWs48IU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300081


On 12/29/2025 5:56 PM, Konrad Dybcio wrote:
> On 12/29/25 7:06 AM, Pradeep P V K wrote:
>> Document the QMP UFS PHY compatible for Qualcomm Hamoa to support
>> physical layer functionality for UFS found on the SoC. Use fallback to
>> indicate the compatibility of the QMP UFS PHY on the Hamoa with that
>> on the SM8550.
>>
>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
>> index fba7b2549dde..b501f76d8c53 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
>> @@ -28,6 +28,10 @@ properties:
>>             - enum:
>>                 - qcom,kaanapali-qmp-ufs-phy
>>             - const: qcom,sm8750-qmp-ufs-phy
>> +      - items:
>> +          - enum:
>> +              - qcom,hamoa-qmp-ufs-phy
>> +          - const: qcom,sm8550-qmp-ufs-phy
> For platforms introduced before we were cleared to use chip codenames,
> let's stay with the numerical identifiers for consistency (i.e. all other
> compatibles in hamoa.dtsi say qcom,x1e80100-xyz)
sure, will update with x1e80100 accordingly.
>
> Konrad

