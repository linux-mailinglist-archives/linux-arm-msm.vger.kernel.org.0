Return-Path: <linux-arm-msm+bounces-81373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB400C5193E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 11:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDA4B18889F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 10:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982B329A326;
	Wed, 12 Nov 2025 10:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6r0iNuN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZUhEo22"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192EF2FD7B4
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 10:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762942184; cv=none; b=LQFAejZtvVqfBln+OddDwBJ3RmFD32aj0pC0/+rNBl+RMSz6MlEnQYAH7/bAPpGuJetNG39ZXVLvExr6B9Pih+vdx+CQUfBWPOdPtThTI6bbhGgWEIZReqdZT8gaffN2YPIISoALUF2SLUR2LyPYZ0dVh9HanNGV62JSLFDr9t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762942184; c=relaxed/simple;
	bh=olYrXkIqmlydcv65JH0VYt15vLnFtcVP3HgL7kAh2vk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sRDWSqXv5KR5iWMRz/f9RtQvVuXXx75bjMNrpyd2NVi0acSmBReFuN19RaNrKiOIN0+Kh/jwxnj5HfFRxI2dehr6aH0GgZmQlZ137KNm89VpXFpvpBXpnvEcmNLStvzmW5dNRXGnyfOhlBHdi6yaSK5I1laGK6YHTMwoAjs6ekU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6r0iNuN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZUhEo22; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC6Ss6J350397
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 10:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z7+KAp8/WxI0gJBqO/9PgX3s79ROrh9F/K5k8HRSUJM=; b=N6r0iNuNQqVu1TUg
	vnhRFf0gAH9VbEhWaFoddkodhBR2JaXz+vmoQoBeP6Ee2pq/6FcZp8GVkZP74OPz
	S/LKT1kstaSLu/mNrmFYAXCbZhx2ufFLt/D1gjRblZePi2A6SKfx9GMNeq33Zb3k
	vTzeCCfLAjws2hBGqleHa4LJe3oBbiWMORllxcVJO4a0N85SHhxs1DZJSHpMz9ud
	WMW6K/rT3CMXn9y5oBuxZshtAwousRA5mxrcFHbjmG/jcaL2A8KHT+PF5lfHJOeV
	Uf56+2GhNjP7iOGea4cqnZuwrDueiyK3++QaUJMYtsx9tsoX5uw9aA2iu6e8mXKu
	nJQ+NA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acn0nrtdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 10:09:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6855557aso13574141cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 02:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762942181; x=1763546981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z7+KAp8/WxI0gJBqO/9PgX3s79ROrh9F/K5k8HRSUJM=;
        b=IZUhEo22w6WfHErDruhmMh74E5XbvT8YM0MbCEKp5EYKpERLGq6ccdnclfsrfHqg8e
         3FQ0M96kGk/2E8NpdKZ7+DMoxA4FvRBb74QDML96svB5u/T2ccm/vvSoMejc4nqpu+QN
         fN2B9gPn2Tl0AjUhvBr1PrXNuo+uvtKp/4w22LabpDHis61FBSTCZg/XlsTeS+HTjq9R
         DcIV7zPneYlFAexvdt8salihhcwrLNPwPVFi+8UrMFqofunT82v/W2ErffPQ2dVBnanc
         97nZ5fClAdIWr5ro/Xkd+M4aj9sW9wR5ZmeFv05KAJbi6Td8I6aTVtk5NcIDS474tQuT
         kJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762942181; x=1763546981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z7+KAp8/WxI0gJBqO/9PgX3s79ROrh9F/K5k8HRSUJM=;
        b=f02ifMLv7jSvO6jvvW1OnxqW14DD4LT833fVL8UpuXDBYCu48P9UlElAWJo2DvAON4
         WG1ITAQ1ikr1OS3A1kDZSwqKaZcKo5kAAG0XximyAJnjbWScwqeVccYtuP2VW2DDxkAh
         DWdBHXs+Qm9KwVYMXM1OY78l86uOz26NiukKWN2TF0lsAcsZjzmqIKaheVSlLnylHXKU
         LNvI+Y/gn0Wmb/hRPKeoGi7MMwUkN72mPuG9DcHu6K1Wsvdm5FpPfi/WJ1qz0wlaFAlv
         isuL9r6fnEefgv4W1MbAxgoRrSbsVfbN0M7a23AEA9R09/9ZULPOt5clS8xE+CUz3A16
         oF3g==
X-Forwarded-Encrypted: i=1; AJvYcCVEZKr0yNF35f+4xKukrgbJUxFTGY+rQR6ZURDRy6qPJ7/ssZYlTp7leevh9WIrXUuJBujmo8rkh59PUDiZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzAxFzn9zOCzNakMVSSHrFqQbx8MNugbo8u2xa0vkqpVntLaTva
	apZvsmUkpzxG3gDHN91IkCF8w1Yi11jPwbK3ltskK0Me/7mEX3W2mXqK/IHmJMbqP3qwWVGSyWG
	6Tkq606d+zW1TCnS5CfUeDfyBWvxqqDwLhEE6OJUF+EcEu7G+2h++hOOOXYAxnM0oBNHH
X-Gm-Gg: ASbGnctlMpHnR3wy4sYAJ+JaVXvWacvszRfJK2zc9hYAWZZhUUUcxH0A7JbBb3lj+w6
	w723Sm1Me/CuBiZD7iTNNpYYEsJmFLbI6VR8oGT4YlI6/xfNovRS9a8Vaadgl3Jg+zhX7fw8kvP
	+GEkQt3RoimyuvIbcoQ3iGXEfMinQZS7n7RRS99NM5uVtsIJ/Xc/QuO5KFACG6RrUTshRZZiHrj
	yajyEtQxNPcNf5EuolBR80I0GxJOX9lugdcgjdAutxkuhj80rmfnVbPBQRTYdhvktgTUZTXs6yS
	yQCkQWrFx0M2oqNFrvAVu+5jnNSt94EccWGCMwAMGI7DCoJ28EW5htnB8rxFSYHeZnnljVmD4NK
	nAvNRZNb0cAwDmpOeIQ0o6LINVA==
X-Received: by 2002:ac8:58d5:0:b0:4ed:ae94:5f5b with SMTP id d75a77b69052e-4edcaaa4f49mr77296461cf.8.1762942181326;
        Wed, 12 Nov 2025 02:09:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRjcsBdXzo+DsSel+yAaYa6lRVf3CufXhegqSBiMMMAqPt5BSkhfBsKJYMr28ZM1ZOvJKSag==
X-Received: by 2002:ac8:58d5:0:b0:4ed:ae94:5f5b with SMTP id d75a77b69052e-4edcaaa4f49mr77296111cf.8.1762942180799;
        Wed, 12 Nov 2025 02:09:40 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47787e8e6acsm26947215e9.9.2025.11.12.02.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 02:09:40 -0800 (PST)
Message-ID: <7eed86f6-97a9-487a-8161-3617597f7391@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 10:09:38 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] slimbus: ngd: Fix reference count leak in
 qcom_slim_ngd_notify_slaves
To: Vinod Koul <vkoul@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, Miaoqian Lin <linmq006@gmail.com>
Cc: stable@vger.kernel.org
References: <20251027060601.33228-1-linmq006@gmail.com>
 <176292442599.64339.7709313480733902465.b4-ty@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <176292442599.64339.7709313480733902465.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: COZHfom-H7ERa2WqOQW9p8jQbBu1-35N
X-Proofpoint-ORIG-GUID: COZHfom-H7ERa2WqOQW9p8jQbBu1-35N
X-Authority-Analysis: v=2.4 cv=acRsXBot c=1 sm=1 tr=0 ts=69145ce6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Yrr5m3MqBTjBsgb0id4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA4MSBTYWx0ZWRfX2XI4hoGTJsf+
 brqM3o7dfefRdfApnfx8d2ZeUoI8X94C/a0wa4f5lTiPIhWOdXmsbFC/uNyC2TF1CUAmA68c601
 io/TB9AMop/ZPfXXidyCACoaCvua+GoAksUuWCkdQ89Dl4NLPG+DsAoKdoaBBvLLkEPcLtwmDg9
 31Xz1jm2lcMizz9w3d3nl7zvTJs0N1LiNJSPtGuk04J36aw0xGBdJEHdHm+ub4LfZYpZjBHl8+q
 quP3kw+hGbtTnGe2lFmBnllPEJlZxrinqINkD0rK0VJ9m/LkX2Ba2m8a/ZMyDHZeLYIWseZSu0x
 Muaksg3BFbmetE7ChiXTXiayOqkzAXt6IiB99B3ScriKHtza6kbywjLiOBYIvaKCSXR3uktXIxS
 MdMhx8fvfiy+j4IRoyk9zy3aKf3NKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120081



On 11/12/25 5:13 AM, Vinod Koul wrote:
> 
> On Mon, 27 Oct 2025 14:06:01 +0800, Miaoqian Lin wrote:
>> The function qcom_slim_ngd_notify_slaves() calls of_slim_get_device() which
>> internally uses device_find_child() to obtain a device reference.
>> According to the device_find_child() documentation,
>> the caller must drop the reference with put_device() after use.
>>
>> Found via static analysis and this is similar to commit 4e65bda8273c
>> ("ASoC: wcd934x: fix error handling in wcd934x_codec_parse_data()")
>>
>> [...]
> 
> Applied, thanks!

These are slimbus patches? any reason why they are going via soundwire tree?

--srini>
> [1/1] slimbus: ngd: Fix reference count leak in qcom_slim_ngd_notify_slaves
>       commit: bcd8db9640bcad313f7fbf8433fcb5459cdd760a
> 
> Best regards,


