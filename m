Return-Path: <linux-arm-msm+bounces-110548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDAoNIxWHWqnYwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 11:53:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 469DF61CD1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 11:53:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5285230A07B5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 09:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7744B38C2BF;
	Mon,  1 Jun 2026 09:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ew2pxJmG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RYtatS3q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AD33403E4
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 09:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780306955; cv=none; b=Bc+Je5OiXPA26ZHCqFkt7dNQ+D4+WRT8PAY9/NobgbWDFinj10uiEHD8a/hUVf4cSjhMFSsI80eHUXlsy1kWi9fbDSjmBT523JbAIQ9Rk3+HJvIKxTc4Vu+SgSO46WyfRhyNmNVLMagFnq9C9GsBVGuEG4t7cvT5x8MFKCKF47Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780306955; c=relaxed/simple;
	bh=GJdFHNbd24vHcHpJljwueSqIzVPfc/WEbuiOwFgJpts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lRMjxV1eBmMkGIU5E49NiR5s9hXGYbgzDANzZv/y4ml/H99DSWfOiJC0rIQnHTMVx8IBESxyvbbXvyYJeZdIFhR9JIsAZemllk+vvEdOZpmyQASXlHl6jXSoFDXSYo/IMVlVSbDcAY3155Waxs4JNnn0ex/h4Tkd48QtQMZCaVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ew2pxJmG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RYtatS3q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65171k9k1375308
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 09:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3SGiO+kxsDx6DwtO9BxKEerL+bbS9WThv2hNXn8BiyI=; b=Ew2pxJmGwa3YvmSH
	w0oDOjUPL/Fz7snMtECVftPwaZ6ByhVBvahSKl4v4akRAfmnKOf29lqeW/mOE5YS
	KBtS6oRebHw7XiUb0k7iNxbLX/wPaboyMS3eelp5htBLVorDNzw+d/8+Lj0omRwk
	HGakgcg4WvOJRd2NrnS8J9NVfZRwCPf+c0+58cJBLud+oEJXoXs93Fj4RUtPY7tp
	gvLr9gUzi+kVfEqkuqpdo89chQC/6GKkfCkATVdzm+AugaFOcvXU7FJuk/MtxyXr
	hdUeUPkUnouot9RAITeNaHlMm00SyfSVgBte81bATvQVpb3bsCh3FeGsU9hiWrst
	Xi18ZQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efpw7q1hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 09:42:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423efbfb61so834970b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 02:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780306952; x=1780911752; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3SGiO+kxsDx6DwtO9BxKEerL+bbS9WThv2hNXn8BiyI=;
        b=RYtatS3qxWbdbnHwKQkKGqKqlH9TnAcqmmBGT8Md4Ss6VQi9ri6LKq92noCDqoUbM6
         3GyYTbShd4kJrUC9N4LysOaHRVMpRg6968wzR/tKfStQOD71c4N+EBwt97/JyTQSxdYe
         RIBQtu2AG2vw1OMAjeX4krcA5GOlzg4tf2VtnXBd6oR6WgBsFaUHXN6oFDemVkD6F3Fs
         NY2NpMsmJzKCbOVW0bYCYbg8wPPWBYGWBrZ4o/MuNodrt5H6MEVqVnrlaomFHiA1ITkK
         0VU8SQQrOTIPO+032gI1HBKisvxSy2yj/SrFN3eQdAV5J8wvWS0vIVLA8ZNuAk2v0d4L
         Z4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780306952; x=1780911752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3SGiO+kxsDx6DwtO9BxKEerL+bbS9WThv2hNXn8BiyI=;
        b=V6MUtaUyckTV2uWWkKv76jd/AWyVkCBDqDZF+HH2KSe6X+SazssJuhY+ltCW0K8Wq6
         u5srXRze6UnB1EQsA8f+rkpA54ucOzB3AeZZGzI5b7k5mpjdt5oZugghizzJUKRix3wJ
         aVBTfcldhLh07IqlPekFwm0B7wW2bSprjsrQ5uVDubzGLZQA+ZQ7fky9Iye0mMwAGG6N
         dTHjpMMR7EyeGxVeL34Q5HPvSOcbup33LHn8DD+G6+ddMP3fYv/9IHJdvd4IgjqL+PR4
         6OxPmw3DyXs39TtJl1kXVzhw2/M6xhryRkAxsGi5og7p4Y8RNAb06/fXvw0wM/pIP9ze
         4ZDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/JnPRF5Oew6eLxsIa0p/FWpsY1UGCiLVq183dqNTcYcXBQ7jB4IMLZ4jnHRyJvr7C8GXz52x99udrYbnhZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxzGLMjSQ7JdIlhJSSoqL5dE3A4psV2oZXRjDKa9/FrfJXLDrLB
	8AREsElmbhgD/WxcHz1V3/fyu6Aysw9Mg4q2XCk7hUxhNxcqY/zwxLF6cJiBZJ8Z38YPGphCyan
	VtSDU9iH6wEmCy95hMln0HH5uECU4+g/zfYp0UHgtG2tGBjpgaU9fAfGrRKWtf3JAKrM0
X-Gm-Gg: Acq92OHOZliRJD0r4NKpEjTEXc4/Fkvi7e7AqgH5TAZkEuqaf0fAgYRjE5RWWrpiYaV
	6TqxxBjnpFt9EXfqGe6LxFcCnl88Ap/Lrz+rRN15ZDlKvBF2AGUyNk87BPmufXv0p+jZmmE2SLi
	A6lyGbk4BnGN3KxNU52HZKUs5S3pCSX/sZBIyDKsOQC6pJfsiRrND6qwIoDWfrzmOm+wVSMWVyt
	Rbk8WXyLHZRJyKIirqOGrkC2snOMRzBaFEmu3ZUSq4rIeoa+POTv2sGBE9zqjat3cDfltoFNJsv
	cuFP0vjBk80TnWnf28DprG0EF1vcowll26Gv2+m0YOcp6mBrrXGd0k9hlXWBzlb8NEOIUaTaFQE
	ZU1ZhI9sBpkPEjeidxAtzoRo36u78OE7s1qqXhu5mSKzsJY1hGynOXCb2JSP3
X-Received: by 2002:a05:6a00:1a94:b0:83b:b0c2:17ea with SMTP id d2e1a72fcca58-842255b4770mr9702267b3a.37.1780306951623;
        Mon, 01 Jun 2026 02:42:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a94:b0:83b:b0c2:17ea with SMTP id d2e1a72fcca58-842255b4770mr9702237b3a.37.1780306951172;
        Mon, 01 Jun 2026 02:42:31 -0700 (PDT)
Received: from [10.219.1.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214affce1sm9867516b3a.9.2026.06.01.02.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 02:42:30 -0700 (PDT)
Message-ID: <83c71ff0-bbc3-4a1f-b18f-ab31dbf3e19d@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 15:12:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] Bluetooth: qca: combine NVM and calibration data for
 QCC2072
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        rahul.samana@oss.qualcomm.com, harshitha.reddy@oss.qualcomm.com,
        dishank.garg@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
References: <20260529180431.3373856-1-yepuri.siddu@oss.qualcomm.com>
 <CAMRc=MeMm2rmeMOg-HcFY4ONvNbrS7qN=ioyAezRhurL_9Vt1Q@mail.gmail.com>
Content-Language: en-US
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
In-Reply-To: <CAMRc=MeMm2rmeMOg-HcFY4ONvNbrS7qN=ioyAezRhurL_9Vt1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zNOWPsPaVCniDtBnVzeNI4NJd_bBych-
X-Proofpoint-ORIG-GUID: zNOWPsPaVCniDtBnVzeNI4NJd_bBych-
X-Authority-Analysis: v=2.4 cv=bNIm5v+Z c=1 sm=1 tr=0 ts=6a1d5408 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=50n7NBc1zfqpnd1YZTIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA5NyBTYWx0ZWRfX78tLJ2C+abn1
 l8VG3QWAywubq/ikfBl2A50J1clXVLGcIQF9e8k7L1+pOeW1OogdSbnHC3g1d3N1CIiGxuBB6XK
 ty6v+F3nNx7e8iQ2WDz4UTybVwcqh4rTu1XkbXtLyCn61xcZnlSF2LvRthJr2lyTz5jNeUT/wZV
 GmyncHRBHSSGhuIK2hkHMDlStlrCqx4tN6jx5Yq/QiNvpSQ0bIX2XoiMXLC4P1sDlPazo3OJmhH
 VquYPn21Nbh4M/D+zJurWxgSDru+1r7ID8mx6VfRUbhmN1Gum91JfKqZXR4NGWnsUW7Tb9VSdr4
 2QvTU8qSEH3HcoPOdIkcSCWp8wfaQvhOC3laoo6W2XT/9h3I6O2rgKGZAMfNsAG8WWcgqJEzDhr
 iHP4NVIJT9G7knFrxQue72XoZrAt7WWGLb/5rw/NTFBLUvlklOoxIcWGWt17hiw7vaUfaTKXcWF
 hICJydt+p6mOc56XaLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010097
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110548-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[quicinc.com,oss.qualcomm.com,vger.kernel.org,holtmann.org,gmail.com,kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yepuri.siddu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 469DF61CD1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 6/1/2026 1:59 PM, Bartosz Golaszewski wrote:
> On Fri, 29 May 2026 20:04:31 +0200, Yepuri Siddu
> <yepuri.siddu@oss.qualcomm.com> said:
>> QCC2072 requires the NVM and calibration data to be delivered to the
>> controller bundled together in an outer TLV of type 4. After loading
>> the NVM file, load the calibration file (qca/ornbcscal<ver>.bin) and
>> combine both into a single buffer with the outer TLV header before
>> passing it to qca_tlv_check_data().
>>
>> The outer TLV header encodes the combined payload length in the high
>> 24 bits and type 4 in the low 8 bits of the type_len field.
>>
>> If the calibration file is unavailable, fall back to downloading the
>> NVM alone.
>>
>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>> ---
>>   drivers/bluetooth/btqca.c | 47 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 47 insertions(+)
>>
>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>> index 0ef7546e7c7a..37db1cd9e8cf 100644
>> --- a/drivers/bluetooth/btqca.c
>> +++ b/drivers/bluetooth/btqca.c
>> @@ -612,6 +612,53 @@ static int qca_download_firmware(struct hci_dev *hdev,
>>   	memcpy(data, fw->data, size);
>>   	release_firmware(fw);
>>
>> +	/* For QCC2072, combine the NVM (type 2) with the calibration file
>> +	 * into a single TLV of outer type 4.
>> +	 */
>> +	if (soc_type == QCA_QCC2072 && config->type == TLV_TYPE_NVM) {
>> +		const struct firmware *calib_fw = NULL;
>> +		char calib_name[32];
>> +		u8 *combined_data = NULL;
>> +		size_t inner_len, combined_size;
>> +		struct tlv_type_hdr *outer_hdr;
>> +		int err;
>> +
>> +		snprintf(calib_name, sizeof(calib_name),
>> +			 "qca/ornbcscal%02x.bin", rom_ver);
>> +		err = request_firmware(&calib_fw, calib_name, &hdev->dev);
>> +		if (err) {
>> +			bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
>> +				   calib_name, err);
>> +			goto skip_combination;
> 
> How about providing a separate function to handle it and avoiding the
> objectively ugly label?

Thank you for the suggestion. Will send a v2 with this addressed.
> 
>> +		}
>> +
>> +		bt_dev_info(hdev, "QCA Downloading %s", calib_name);
>> +
>> +		inner_len = size + calib_fw->size;
>> +		combined_size = sizeof(*outer_hdr) + inner_len;
>> +		combined_data = vmalloc(combined_size);
>> +		if (!combined_data) {
>> +			bt_dev_warn(hdev,
>> +				   "QCA Failed to allocate memory for file: %s",
>> +				   calib_name);
>> +			release_firmware(calib_fw);
>> +			goto skip_combination;
>> +		}
>> +
>> +		outer_hdr = (struct tlv_type_hdr *)combined_data;
>> +		/* high 24 bits = payload length, low 8 bits = type */
>> +		outer_hdr->type_len = cpu_to_le32((inner_len << 8) | 4);
>> +		memcpy(combined_data + sizeof(*outer_hdr), data, size);
>> +		memcpy(combined_data + sizeof(*outer_hdr) + size,
>> +		       calib_fw->data, calib_fw->size);
>> +		release_firmware(calib_fw);
>> +		vfree(data);
>> +		data = combined_data;
>> +		size = combined_size;
> 
> Otherwise it looks ok to me.
> 
> Bartosz
> 
>> +skip_combination:
>> +		;
>> +	}
>> +
>>   	ret = qca_tlv_check_data(hdev, config, data, size, soc_type);
>>   	if (ret)
>>   		goto out;
>> --
>> 2.34.1
>>
>>


