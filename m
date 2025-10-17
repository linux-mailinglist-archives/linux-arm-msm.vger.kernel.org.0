Return-Path: <linux-arm-msm+bounces-77667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F13E3BE6350
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 05:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CBC24034B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 03:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA3B23A564;
	Fri, 17 Oct 2025 03:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j7CiWD4X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE54933F9
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 03:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760671656; cv=none; b=KL+QsEY7rjJ3/tWFrfkxT8tpd5ZS0pq0YtbkL+kmD7Xyj/RU3reqOmGltTVe9J6SCxihufH0A+gdPSJGtNvxAKEpqOgX2qkt6cLtaoXKNHQtCy3pdsT0XMV1jjQJ8ozLqZC++Sm/SO2IxujcKKcprQiBptYQrN5b3vY1RduchhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760671656; c=relaxed/simple;
	bh=bpxlvObGWZqlXhfi4AkPZMu6AjrfNg8tFGT5e+6zURE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U7affB/nsH5xg9vqnsD8i/OtOaQUXSh9HPj0XgDKfGocPUj9Pi5j1ggFMueS6sc7ihHsFEFE3ywAjdebyEydyIZGqmYH1FLanfJH7Uk2c9kBspVYLv7yyTFHrRftG0J/U348Tk3E+Ox/+6eGsziO2Y29TgwT3GaLtWOYDOBLAlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j7CiWD4X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLdvu009737
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 03:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/89NhQKdqoqte+xpicQhKtPZGxqewp0bE+hnVypDqXQ=; b=j7CiWD4XczloLFYf
	uQx26OVr+Du/JH01q7B/GVcvRHccunIjpiE55veS1fKcp4E446GtmNt124MNEqQW
	Rse+DjfwmKz75fOvsuc/eLtW6UPXoXs4kqOPLtlJd5H4ozKjKV9LVBdBe24qYJdk
	OE9Pc+R+kfl6KyfNNSEuTE8kc5QuSNKMMh0MarkwSt7w5PS0n+6ZZ+EoxXhZAcU9
	ddgihQhzrdTZlwMuifO3JvxBvvA/+ngrV4c9/OB9P4iOfKzbdzw25wIFLmpk97+Z
	pzZVpe5xqmVlt5VH3htaUuhjzdEWGx5qwFyZN2bI/r0zw64I+b19VHewYX4PeJn/
	ECYiWg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1apxbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 03:27:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32edda89a37so1405616a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 20:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760671653; x=1761276453;
        h=content-transfer-encoding:fcc:content-language:user-agent
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/89NhQKdqoqte+xpicQhKtPZGxqewp0bE+hnVypDqXQ=;
        b=ElxOAtYZVQUmYliVIJyrwiF6YC0gc3YJiOT1gMxfZohka6H+tS2KsveCWxWDvzCXQj
         8ivzquP7/wQQ7k0BHL5YIOIrpcnVdEuX3zWr7weGe/QDQKCEDYOXfgj8gkjpNvSyr7pt
         kH4ihHfygDFnybI/3xPMQoCWMUtpmerLniJD0VMfosZ9lz4SKyI8rMsjcJ8UpzSzx52T
         73e841OtEJizOukfBZo6IaI7hNYsMayl7EnT99d88BXi1y64GPtvh8nPzccKb27xBOBL
         /eaCi4TlVjsSE9MpRCyTZBybhoI9pnrgNdROVyS1jnzHC2RuHdae0MLTm1Xh/V32w3Wi
         qSUg==
X-Forwarded-Encrypted: i=1; AJvYcCU97z7BX59EsY48p0rDXskecxEzwfNQR62/M7lYE5IoSZI7+fD4WiuaPRqwNRW54QraiKMafYfg9Au8W2aw@vger.kernel.org
X-Gm-Message-State: AOJu0YwELtWU11aao1gUrKJqvJlaExshFbGDh1kTb8n/A7tkYY98fL9B
	jor6dnN1mgu1E8AM5X8wJ5ZxaCau9mvQDeiD+/vlgWPD+HMUWb9ZkF028e6zIi2WcGGURkqGd40
	JoRXFCBrv4NEofVwdxE9eRH06+tdTTomE2cMLfoYuyGRQpexx43G/czRXyO5Yaizw+x02
X-Gm-Gg: ASbGncv/ybVZmQkPQuivZwHV2679n3cdK8SNt2T6sHDmyOZuWg3w80QSIcxls2meq4j
	iKCQSJAxHggEEF0VgwzcZjc3rtzJw5kuhupKhQl70Z0aYe4Te+QHwrPetQxNtJlSqfvoCKZwGV/
	IUB6hK0AO8wIEI4xdelXgDQyD/vRYh0waorzg8cHk+q7WRAG/9EQFEZhA72hkBvNwS4wk2bLWh7
	Q6uEjSfJDtX4H5mh+Gh05vdcXouDWsIOx+hHeZnZakgk4C+3isceHMV08rFM9KZ4p5g/Z0xKPNT
	UHPx7j2u4AcFdPJHxcyxhNtMS3aF+I2hjEv+gDGND49o8OOxuoAJ9r+FsM9cksG+92nvqs5N/uo
	Hpx+RjcwkMKDwAxKNUdJdpfwMOncN
X-Received: by 2002:a17:903:2343:b0:290:a3b9:d4c3 with SMTP id d9443c01a7336-290cb7594d6mr24632355ad.56.1760671652956;
        Thu, 16 Oct 2025 20:27:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9L7F90cxwCk31VMkjU5gCAsBpLq95tQORQNvi3x3FLHAzsKadq8hknCImdNDErBQ2m48CHQ==
X-Received: by 2002:a17:903:2343:b0:290:a3b9:d4c3 with SMTP id d9443c01a7336-290cb7594d6mr24632095ad.56.1760671652548;
        Thu, 16 Oct 2025 20:27:32 -0700 (PDT)
Received: from cbsp-sz01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33be54cad3esm104753a91.12.2025.10.16.20.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 20:27:32 -0700 (PDT)
From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: lemans: pmic: enable rtc
Date: Fri, 17 Oct 2025 11:26:26 +0800
Message-ID: <794c77bb-db9b-4b34-b632-62ea56616213@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <0dd6a528-d204-4073-a4b6-76356e71c5fc@oss.qualcomm.com>
References: <20250925-add-rtc-for-lemans-v1-1-17fc56451c84@oss.qualcomm.com>
 <0dd6a528-d204-4073-a4b6-76356e71c5fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
X-Mozilla-Draft-Info: internal/draft; vcard=0; receipt=0; DSN=0; uuencode=0;
 attachmentreminder=0; deliveryformat=0
X-Identity-Key: id1
Fcc: imap://tingguo.cheng%40oss.qualcomm.com@imap.gmail.com/[Gmail]/Sent Mail
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68f1b7a5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rOiIU-5ZP3SxAgHWUzgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: LguRm2UO-EyABsY6rDTfGjrgcepLWa5u
X-Proofpoint-ORIG-GUID: LguRm2UO-EyABsY6rDTfGjrgcepLWa5u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX7EmUYhsyQlr1
 7VAsLNmgtXH+fYGhoIMCF7uw+JMBLKdYzKHvXrSKTEtnki9lSCyj1T8iGGorHfWKPx9yUks2/lD
 UuJNgPV22/y2QgNwkyQZqKnQF5NuHmur1RgzCaMxTz1kbHX9JbXVKbg3KJCJloBKlfLphvMjcv2
 sHEHVtDKLo76Hstvhq8dHQAAy6FeM4+HknkcMvTtJsxKAC9GZPzVtfxiRfr5ATPmNammJ99018n
 +Io4JsdVa73qbDh7FDEGZQaNa+czoyTmKxOTb94uclAsaJkqyd7gtaISCsVKuZJCZKKpCYAErFe
 r5VRzRbgBxjLNEbSOvh7HqdPuviX32Q+nf07W/EtttXP4VKNqeDv3+feS3X7cozTGoLBapdoG54
 DbLAkqzetFxlEddT8cid8km/I/1lJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

=0D
On 9/25/2025 7:34 PM, Konrad Dybcio wrote:=0D
> On 9/25/25 9:48 AM, Tingguo Cheng wrote:=0D
>> Add RTC node, the RTC is controlled by PMIC device via spmi bus.=0D
> subject: "arm64: dts: qcom: lemans-pmics: foo"=0D
>=0D
> (following the style for the directory)=0D
Posted v2 to modify this.=0D
>> Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>=0D
>> ---=0D
>>   arch/arm64/boot/dts/qcom/lemans-pmics.dtsi | 7 +++++++=0D
>>   1 file changed, 7 insertions(+)=0D
>>=0D
>> diff --git a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi b/arch/arm64/boo=
t/dts/qcom/lemans-pmics.dtsi=0D
>> index 1369c3d43f866de9d8cd5cd4985241b99c0a0454..9e0d05c1b39ce229d5d4310e=
a1df1bf02e689178 100644=0D
>> --- a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi=0D
>> +++ b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi=0D
>> @@ -132,6 +132,13 @@ pmm8654au_0_pon_resin: resin {=0D
>>   			};=0D
>>   		};=0D
>>   =0D
>> +		pmm8654au_0_rtc: rtc@6100 {=0D
>> +			compatible =3D "qcom,pmk8350-rtc";=0D
>> +			reg =3D <0x6100>, <0x6200>;=0D
>> +			reg-names =3D "rtc", "alarm";=0D
> 1 reg and name a line, please=0D
Posted v2 for this: =0D
https://lore.kernel.org/all/20251017-add-rtc-for-lemans-v2-1-0aaf174b25b9@o=
ss.qualcomm.com/=0D
 >> +			interrupts =3D <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;=0D
> Do we not need "qcom,no-alarm" on lemans?=0D
=0D
No, it's not needed on lemans. "no-alarm" is only needed on compute =0D
targets where windows TAD feature will support it.=0D
=0D
>=0D
> Konrad=0D

