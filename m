Return-Path: <linux-arm-msm+bounces-55869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E83A9EA4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 10:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 581AB17511F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 08:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B46D223715;
	Mon, 28 Apr 2025 08:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hRFFzwq3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673EE84D02;
	Mon, 28 Apr 2025 08:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745827621; cv=none; b=gJv1OBmx03zDz6ESTGljwyotrCYO1amDGsxCgFjRsjWJptLKUeNNoZ+6gBYEohNE0tfilMHbUv7fZACFkBWGaU/2hYtz4gd9XJat8BNcQPUVaARSyKHxk+7EQld8iyIUKFRmRu1J93AJEwr0b9oCb02su7+WTBl1KdYPcUgV1GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745827621; c=relaxed/simple;
	bh=qwfD9D1uqqLDoL5Y2GqhhNIPjQAEpW33oURtY+o/IqE=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:From:To:CC:
	 References:In-Reply-To; b=PfT9Fh4wLriLCCAeP/ANQ4TYEx4hO9ltoZ5ELa4AxF/rhmyoaT6Iew41TWOGj28SAB18dGiJKI+DNaAFp2UB5xwEbNwzdKZpOTA/ShfCL9Yc8kAfYXxRiJM2varoruPmeneTiexfDx1cZw6RhGwhW4Rin+cVY+nsCm+9pE7IYrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hRFFzwq3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S51nHj016504;
	Mon, 28 Apr 2025 08:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XjDuoB0y7WRmsSdmBPRV3zxe
	gvlgtGdoXbXFNxRNteM=; b=hRFFzwq3BslGWxJKwmb74mpq3XBKEtbFBJDAggCd
	1evkyxV/FWabFFqEWl4Oe1Nt+vyGbbKwErM9UDE2685fCeGz1W6gqjQxo80emB6Y
	4poLLiMRJc56uomLDb8oRF1gCPx3p9RgHr79PoRUTY+YJx4Q65ebTzw8ZJ6eod5X
	6wnEGnfU3ZSMbp4oAIshVJ6otojXbcbrYdcZF02HH2SXGJL9dz82UcXO5DcUaT7H
	bNo3oJd3XLEGxxqHChMNGCjIrupi4LdhIqp1lQ6eYox1/T66vA5LEPFaR6HTgKRB
	C7j0Z1fdwez3zuZ1fVS8OjJjY4O4U58ag8GjEV/t8UAB4w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnmy0ra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 08:06:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S86RMk013504
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 08:06:27 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Apr
 2025 01:06:22 -0700
Content-Type: multipart/mixed;
	boundary="------------7Hg0xvlwoG7aMJ0gYxeWQEtZ"
Message-ID: <29c3852c-3218-4b42-bc41-75721a95fccc@quicinc.com>
Date: Mon, 28 Apr 2025 16:06:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/8] Support Multi-frequency scale for UFS
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: Luca Weiss <luca.weiss@fairphone.com>, <quic_cang@quicinc.com>,
        <bvanassche@acm.org>, <mani@kernel.org>, <beanhuo@micron.com>,
        <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
        <martin.petersen@oracle.com>, <quic_nguyenb@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <peter.wang@mediatek.com>,
        <quic_rampraka@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        "Neil
 Armstrong" <neil.armstrong@linaro.org>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        "open list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-kernel@vger.kernel.org>,
        "moderated
 list:ARM/Mediatek SoC support:Keyword:mediatek"
	<linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-mediatek@lists.infradead.org>
References: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
 <D9FZ9U3AEXW4.1I12FX3YQ3JPW@fairphone.com>
 <df287609-a095-4234-b23b-d335b474a130@quicinc.com>
Content-Language: en-US
In-Reply-To: <df287609-a095-4234-b23b-d335b474a130@quicinc.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: L18uyG7VkTqGkvz5ZogRtSi5Q6-FeqkB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA2NSBTYWx0ZWRfX6QpvjFNFlNsz a2/5vZnFVdt7JKXEitSJYGYHn4DaBPDbNxTYWZ2ly+dJT6quasiuQeqH79V+1X4tt38FZhzGj4M Lqem1oIE+/1Wd/G6E4lOvALP4st6bkxeVG4Aw/F3jMLRanqKgETj54+T/zZ3slKLq++p7M4MhP5
 Lg4ZRz729/qMrN/5wpJlu6Qihy57fTvWiTZGotmiQhkp0dnWjHRtDeP7mL2yL2MbScVqccjPGrS g+8AHQg19bkNkfoXHqHIPOdv6l83hMNFsSSZ4JA3PaZLNNNQOCXR//Z9DDm6G1LWGdLSI4RPvtP oLfERRTY7ZBnLUclxo7TyXynAyzHGkzH1t1cEbsRqkQUAddIzj5puuuP7834M8hDLvE/tQIfx+M
 ffnweM8EWKLgkc16nfsk19pxAhNwl74PhUDFANa7ylCyB3AeS7r7STEXQEIAP+V+RYNpVn2u
X-Proofpoint-GUID: L18uyG7VkTqGkvz5ZogRtSi5Q6-FeqkB
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=680f3704 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=OCWSx1pRhinruJsEzzEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=COk6AnOGAAAA:8 a=nhbVmEzZaOUHOQeTI54A:9 a=B2y7HmGcmWMA:10 a=kdKX5fuSuaTecows234A:9 a=21p7Rwg2UGKFlaQOxrUA:9 a=Soq9LBFxuPC4vsCAQt-j:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280065

--------------7Hg0xvlwoG7aMJ0gYxeWQEtZ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

We made changes to fix this special platform issue and verified it can
fix this issue.
Could you help double check if attached 3 patched can fix it from you side?
If it is OK from you side as well, we will submit the final patches to
upstream

Thanks a lot~

BRs
Ziqi

On 4/27/2025 4:14 PM, Ziqi Chen wrote:
> Hi Luca,
> 
> Thanks for your report.
> Really,  6350 is a special platform that the UFS_PHY_AXI_CLK doesn't
> match to the UFS_PHY_UNIPRO_CORE_CLK. We already found out the root
> cause and discussing the fix. We will submit change to fix this corner
> case.
> 
> BRs
> Ziqi
> 
> On 4/26/2025 3:48 AM, Luca Weiss wrote:
>> Hi Ziqi,
>>
>> On Thu Feb 13, 2025 at 9:00 AM CET, Ziqi Chen wrote:
>>> With OPP V2 enabled, devfreq can scale clocks amongst multiple frequency
>>> plans. However, the gear speed is only toggled between min and max 
>>> during
>>> clock scaling. Enable multi-level gear scaling by mapping clock 
>>> frequencies
>>> to gear speeds, so that when devfreq scales clock frequencies we can put
>>> the UFS link at the appropraite gear speeds accordingly.
>>
>> I believe this series is causing issues on SM6350:
>>
>> [    0.859449] ufshcd-qcom 1d84000.ufshc: ufs_qcom_freq_to_gear_speed: 
>> Unsupported clock freq : 200000000
>> [    0.886668] ufshcd-qcom 1d84000.ufshc: UNIPRO clk freq 200 MHz not 
>> supported
>> [    0.903791] devfreq 1d84000.ufshc: dvfs failed with (-22) error
>>
>> That's with this patch, I actually haven't tried without on v6.15-rc3
>> https://lore.kernel.org/all/20250314-sm6350-ufs-things- 
>> v1-2-3600362cc52c@fairphone.com/
>>
>> I believe the issue appears because core clk and unipro clk rates don't
>> match on this platform, so this 200 MHz for GCC_UFS_PHY_AXI_CLK is not a
>> valid unipro clock rate, but for GCC_UFS_PHY_UNIPRO_CORE_CLK it's
>> specified to 150 MHz in the opp table.
>>
>> Regards
>> Luca
>>
>>>
>>> This series has been tested on below platforms -
>>> sm8550 mtp + UFS3.1
>>> SM8650 MTP + UFS3.1
>>> SM8750 MTP + UFS4.0
> 

--------------7Hg0xvlwoG7aMJ0gYxeWQEtZ
Content-Type: text/plain; charset="UTF-8";
	name="0001-ufs-host-ufs-qcom-Map-OPP-freq-to-UniPro-Core-Clock-.patch"
Content-Disposition: attachment;
	filename*0="0001-ufs-host-ufs-qcom-Map-OPP-freq-to-UniPro-Core-Clock-.pa";
	filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBjMzZkZjg2OTc2YjJkOGQ2YzYzN2Y1YTc4NzIyODFjODQ2ODY2ZTQzIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBDYW4gR3VvIDxxdWljX2NhbmdAcXVpY2luYy5jb20+
CkRhdGU6IFN1biwgMjcgQXByIDIwMjUgMDA6MDU6NTkgLTA3MDAKU3ViamVjdDogW1BBVENI
IDEvM10gdWZzOiBob3N0OiB1ZnMtcWNvbTogTWFwIE9QUCBmcmVxIHRvIFVuaVBybyBDb3Jl
IENsb2NrCiBmcmVxCgpTaWduZWQtb2ZmLWJ5OiBDYW4gR3VvIDxxdWljX2NhbmdAcXVpY2lu
Yy5jb20+Ci0tLQogZHJpdmVycy91ZnMvaG9zdC91ZnMtcWNvbS5jIHwgNDMgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDQyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Vmcy9ob3N0
L3Vmcy1xY29tLmMgYi9kcml2ZXJzL3Vmcy9ob3N0L3Vmcy1xY29tLmMKaW5kZXggYzA3NjFj
Y2MxMzgxLi44Y2I4ZjYwZThjODkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdWZzL2hvc3QvdWZz
LXFjb20uYworKysgYi9kcml2ZXJzL3Vmcy9ob3N0L3Vmcy1xY29tLmMKQEAgLTE5MjIsMTEg
KzE5MjIsNTIgQEAgc3RhdGljIGludCB1ZnNfcWNvbV9jb25maWdfZXNpKHN0cnVjdCB1ZnNf
aGJhICpoYmEpCiAJcmV0dXJuIHJldDsKIH0KIAorc3RhdGljIHVuc2lnbmVkIGxvbmcgdWZz
X3Fjb21fb3BwX3RvX2Nsa19mcmVxKHN0cnVjdCB1ZnNfaGJhICpoYmEsIHVuc2lnbmVkIGxv
bmcgZnJlcSwgY2hhciAqbmFtZSkKK3sKKwlzdHJ1Y3QgdWZzX2Nsa19pbmZvICpjbGtpOwor
CXN0cnVjdCBkZXZfcG1fb3BwICpvcHA7CisJdW5zaWduZWQgbG9uZyB1bmlwcm9fZnJlcTsK
KwlpbnQgaWR4ID0gMDsKKwlib29sIGZvdW5kID0gZmFsc2U7CisKKwlvcHAgPSBkZXZfcG1f
b3BwX2ZpbmRfZnJlcV9leGFjdF9pbmRleGVkKGhiYS0+ZGV2LCBmcmVxLCAwLCB0cnVlKTsK
KwlpZiAoSVNfRVJSKG9wcCkpIHsKKwkJZGV2X2VycihoYmEtPmRldiwgIkZhaWxlZCB0byBm
aW5kIE9QUCBmb3IgZXhhY3QgZnJlcXVlbmN5ICVsdVxuIiwgZnJlcSk7CisJCXJldHVybiAw
OworCX0KKworCWxpc3RfZm9yX2VhY2hfZW50cnkoY2xraSwgJmhiYS0+Y2xrX2xpc3RfaGVh
ZCwgbGlzdCkgeworCQlpZiAoIXN0cmNtcChjbGlraS0+bmFtZSwgbmFtZSkpIHsKKwkJCWZv
dW5kID0gdHJ1ZTsKKwkJCWJyZWFrOworCQl9CisKKwkJaWR4ICsrOworCX0KKworCWlmICgh
Zm91bmQpIHsKKwkJZGV2X2VycihoYmEtPmRldiwgIkZhaWxlZCB0byBmaW5kICVzIGluIGNs
ayBsaXN0XG4iLCBuYW1lKTsKKwkJZGV2X3BtX29wcF9wdXQob3BwKTsKKwkJcmV0dXJuIDA7
CisJfQorCisJdW5pcHJvX2ZyZXEgPSBkZXZfcG1fb3BwX2dldF9mcmVxX2luZGV4ZWQob3Bw
LCBpZHgpOworCisJZGV2X3BtX29wcF9wdXQob3BwKTsKKworCXJldHVybiB1bmlwcm9fZnJl
cTsKK30KKwogc3RhdGljIHUzMiB1ZnNfcWNvbV9mcmVxX3RvX2dlYXJfc3BlZWQoc3RydWN0
IHVmc19oYmEgKmhiYSwgdW5zaWduZWQgbG9uZyBmcmVxKQogewogCXUzMiBnZWFyID0gMDsK
Kwl1bnNpZ25lZCBsb25nIHVuaXByb19mcmVxOworCisJaWYgKCFoYmEtPnVzZV9wbV9vcHAp
CisJCXJldHVybiBnZWFyOwogCi0Jc3dpdGNoIChmcmVxKSB7CisJdW5pcHJvX2ZyZXEgPSB1
ZnNfcWNvbV9vcHBfdG9fY2xrX2ZyZXEoaGJhLCBmcmVxLCAiY29yZV9jbGtfdW5pcHJvIik7
CisJc3dpdGNoICh1bmlwcm9fZnJlcSkgewogCWNhc2UgNDAzMDAwMDAwOgogCQlnZWFyID0g
VUZTX0hTX0c1OwogCQlicmVhazsKLS0gCjIuMzQuMQoK
--------------7Hg0xvlwoG7aMJ0gYxeWQEtZ
Content-Type: text/plain; charset="UTF-8";
	name="0002-ufs-host-ufs-qcom-Fix-ufs_qcom_core_clk_ctrl.patch"
Content-Disposition: attachment;
	filename="0002-ufs-host-ufs-qcom-Fix-ufs_qcom_core_clk_ctrl.patch"
Content-Transfer-Encoding: base64

RnJvbSA2NTVlZDcwZWEyZTQzOWJhNzNmMGVkOTUwYzkyNGY3YWQ1OWNjODNmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBDYW4gR3VvIDxxdWljX2NhbmdAcXVpY2luYy5jb20+
CkRhdGU6IFN1biwgMjcgQXByIDIwMjUgMDA6MjI6MzggLTA3MDAKU3ViamVjdDogW1BBVENI
IDIvM10gdWZzOiBob3N0OiB1ZnMtcWNvbTogRml4IHVmc19xY29tX2NvcmVfY2xrX2N0cmwo
KQoKU2lnbmVkLW9mZi1ieTogQ2FuIEd1byA8cXVpY19jYW5nQHF1aWNpbmMuY29tPgotLS0K
IGRyaXZlcnMvdWZzL2hvc3QvdWZzLXFjb20uYyB8IDM1ICsrKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTAg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy91ZnMvaG9zdC91ZnMtcWNvbS5j
IGIvZHJpdmVycy91ZnMvaG9zdC91ZnMtcWNvbS5jCmluZGV4IDhjYjhmNjBlOGM4OS4uMzk4
Y2MyMWYyY2U0IDEwMDY0NAotLS0gYS9kcml2ZXJzL3Vmcy9ob3N0L3Vmcy1xY29tLmMKKysr
IGIvZHJpdmVycy91ZnMvaG9zdC91ZnMtcWNvbS5jCkBAIC0xMDMsNyArMTAzLDggQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBfX3Vmc19xY29tX2J3X3RhYmxlIHsKIH07CiAKIHN0YXRpYyB2
b2lkIHVmc19xY29tX2dldF9kZWZhdWx0X3Rlc3RidXNfY2ZnKHN0cnVjdCB1ZnNfcWNvbV9o
b3N0ICpob3N0KTsKLXN0YXRpYyBpbnQgdWZzX3Fjb21fc2V0X2NvcmVfY2xrX2N0cmwoc3Ry
dWN0IHVmc19oYmEgKmhiYSwgdW5zaWduZWQgbG9uZyBmcmVxKTsKK3N0YXRpYyB1bnNpZ25l
ZCBsb25nIHVmc19xY29tX29wcF90b19jbGtfZnJlcShzdHJ1Y3QgdWZzX2hiYSAqaGJhLCB1
bnNpZ25lZCBsb25nIGZyZXEsIGNoYXIgKm5hbWUpOworc3RhdGljIGludCB1ZnNfcWNvbV9z
ZXRfY29yZV9jbGtfY3RybChzdHJ1Y3QgdWZzX2hiYSAqaGJhLCBib29sIGlzX3NjYWxlX3Vw
LCB1bnNpZ25lZCBsb25nIGZyZXEpOwogCiBzdGF0aWMgc3RydWN0IHVmc19xY29tX2hvc3Qg
KnJjZGV2X3RvX3Vmc19ob3N0KHN0cnVjdCByZXNldF9jb250cm9sbGVyX2RldiAqcmNkKQog
ewpAQCAtNjAyLDcgKzYwMyw3IEBAIHN0YXRpYyBpbnQgdWZzX3Fjb21fbGlua19zdGFydHVw
X25vdGlmeShzdHJ1Y3QgdWZzX2hiYSAqaGJhLAogCQkJcmV0dXJuIC1FSU5WQUw7CiAJCX0K
IAotCQllcnIgPSB1ZnNfcWNvbV9zZXRfY29yZV9jbGtfY3RybChoYmEsIFVMT05HX01BWCk7
CisJCWVyciA9IHVmc19xY29tX3NldF9jb3JlX2Nsa19jdHJsKGhiYSwgdHJ1ZSwgVUxPTkdf
TUFYKTsKIAkJaWYgKGVycikKIAkJCWRldl9lcnIoaGJhLT5kZXYsICJjZmcgY29yZSBjbGsg
Y3RybCBmYWlsZWRcbiIpOwogCQkvKgpAQCAtMTM2MCwyNCArMTM2MSwzOCBAQCBzdGF0aWMg
aW50IHVmc19xY29tX3NldF9jbGtfNDBuc19jeWNsZXMoc3RydWN0IHVmc19oYmEgKmhiYSwK
IAlyZXR1cm4gdWZzaGNkX2RtZV9zZXQoaGJhLCBVSUNfQVJHX01JQihQQV9WU19DT1JFX0NM
S180ME5TX0NZQ0xFUyksIHJlZyk7CiB9CiAKLXN0YXRpYyBpbnQgdWZzX3Fjb21fc2V0X2Nv
cmVfY2xrX2N0cmwoc3RydWN0IHVmc19oYmEgKmhiYSwgdW5zaWduZWQgbG9uZyBmcmVxKQor
c3RhdGljIGludCB1ZnNfcWNvbV9zZXRfY29yZV9jbGtfY3RybChzdHJ1Y3QgdWZzX2hiYSAq
aGJhLCBib29sIGlzX3NjYWxlX3VwLCB1bnNpZ25lZCBsb25nIGZyZXEpCiB7CiAJc3RydWN0
IHVmc19xY29tX2hvc3QgKmhvc3QgPSB1ZnNoY2RfZ2V0X3ZhcmlhbnQoaGJhKTsKIAlzdHJ1
Y3QgbGlzdF9oZWFkICpoZWFkID0gJmhiYS0+Y2xrX2xpc3RfaGVhZDsKIAlzdHJ1Y3QgdWZz
X2Nsa19pbmZvICpjbGtpOwogCXUzMiBjeWNsZXNfaW5fMXVzID0gMDsKIAl1MzIgY29yZV9j
bGtfY3RybF9yZWc7CisJdW5zaWduZWQgbG9uZyBjbGtfZnJlcTsKIAlpbnQgZXJyOwogCiAJ
bGlzdF9mb3JfZWFjaF9lbnRyeShjbGtpLCBoZWFkLCBsaXN0KSB7CiAJCWlmICghSVNfRVJS
X09SX05VTEwoY2xraS0+Y2xrKSAmJgogCQkgICAgIXN0cmNtcChjbGtpLT5uYW1lLCAiY29y
ZV9jbGtfdW5pcHJvIikpIHsKLQkJCWlmICghY2xraS0+bWF4X2ZyZXEpCisJCQlpZiAoIWNs
a2ktPm1heF9mcmVxKSB7CiAJCQkJY3ljbGVzX2luXzF1cyA9IDE1MDsgLyogZGVmYXVsdCBm
b3IgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkgKi8KLQkJCWVsc2UgaWYgKGZyZXEgPT0gVUxP
TkdfTUFYKQorCQkJCWJyZWFrOworCQkJfQorCisJCQlpZiAoZnJlcSA9PSBVTE9OR19NQVgp
IHsKIAkJCQljeWNsZXNfaW5fMXVzID0gY2VpbChjbGtpLT5tYXhfZnJlcSwgSFpfUEVSX01I
Wik7Ci0JCQllbHNlCi0JCQkJY3ljbGVzX2luXzF1cyA9IGNlaWwoZnJlcSwgSFpfUEVSX01I
Wik7CisJCQkJYnJlYWs7CisJCQl9CisKKwkJCWlmICghaGJhLT51c2VfcG1fb3BwKSB7CisJ
CQkJaWYgKGlzX3NjYWxlX3VwKQorCQkJCQljeWNsZXNfaW5fMXVzID0gY2VpbChjbGtpLT5t
YXhfZnJlcSwgSFpfUEVSX01IWik7CisJCQkJZWxzZQorCQkJCQljeWNsZXNfaW5fMXVzID0g
Y2VpbChjbGtfZ2V0X3JhdGUoY2xraS0+Y2xrKSwgSFpfUEVSX01IWik7CisJCQl9IGVsc2Ug
eworCQkJCWNsa19mcmVxID0gdWZzX3Fjb21fb3BwX3RvX2Nsa19mcmVxKGhiYSwgZnJlcSwg
ImNvcmVfY2xrX3VuaXBybyIpOworCQkJCWN5Y2xlc19pbl8xdXMgPSBjZWlsKGNsa19mcmVx
LCBIWl9QRVJfTUhaKTsKKwkJCX0KIAogCQkJYnJlYWs7CiAJCX0KQEAgLTE0MjUsNyArMTQ0
MCw3IEBAIHN0YXRpYyBpbnQgdWZzX3Fjb21fY2xrX3NjYWxlX3VwX3ByZV9jaGFuZ2Uoc3Ry
dWN0IHVmc19oYmEgKmhiYSwgdW5zaWduZWQgbG9uZyBmCiAJCXJldHVybiByZXQ7CiAJfQog
CS8qIHNldCB1bmlwcm8gY29yZSBjbG9jayBhdHRyaWJ1dGVzIGFuZCBjbGVhciBjbG9jayBk
aXZpZGVyICovCi0JcmV0dXJuIHVmc19xY29tX3NldF9jb3JlX2Nsa19jdHJsKGhiYSwgZnJl
cSk7CisJcmV0dXJuIHVmc19xY29tX3NldF9jb3JlX2Nsa19jdHJsKGhiYSwgdHJ1ZSwgZnJl
cSk7CiB9CiAKIHN0YXRpYyBpbnQgdWZzX3Fjb21fY2xrX3NjYWxlX3VwX3Bvc3RfY2hhbmdl
KHN0cnVjdCB1ZnNfaGJhICpoYmEpCkBAIC0xNDU3LDcgKzE0NzIsNyBAQCBzdGF0aWMgaW50
IHVmc19xY29tX2Nsa19zY2FsZV9kb3duX3ByZV9jaGFuZ2Uoc3RydWN0IHVmc19oYmEgKmhi
YSkKIHN0YXRpYyBpbnQgdWZzX3Fjb21fY2xrX3NjYWxlX2Rvd25fcG9zdF9jaGFuZ2Uoc3Ry
dWN0IHVmc19oYmEgKmhiYSwgdW5zaWduZWQgbG9uZyBmcmVxKQogewogCS8qIHNldCB1bmlw
cm8gY29yZSBjbG9jayBhdHRyaWJ1dGVzIGFuZCBjbGVhciBjbG9jayBkaXZpZGVyICovCi0J
cmV0dXJuIHVmc19xY29tX3NldF9jb3JlX2Nsa19jdHJsKGhiYSwgZnJlcSk7CisJcmV0dXJu
IHVmc19xY29tX3NldF9jb3JlX2Nsa19jdHJsKGhiYSwgZmFsc2UsIGZyZXEpOwogfQogCiBz
dGF0aWMgaW50IHVmc19xY29tX2Nsa19zY2FsZV9ub3RpZnkoc3RydWN0IHVmc19oYmEgKmhi
YSwgYm9vbCBzY2FsZV91cCwKQEAgLTE5MzcsNyArMTk1Miw3IEBAIHN0YXRpYyB1bnNpZ25l
ZCBsb25nIHVmc19xY29tX29wcF90b19jbGtfZnJlcShzdHJ1Y3QgdWZzX2hiYSAqaGJhLCB1
bnNpZ25lZCBsb25nCiAJfQogCiAJbGlzdF9mb3JfZWFjaF9lbnRyeShjbGtpLCAmaGJhLT5j
bGtfbGlzdF9oZWFkLCBsaXN0KSB7Ci0JCWlmICghc3RyY21wKGNsaWtpLT5uYW1lLCBuYW1l
KSkgeworCQlpZiAoIXN0cmNtcChjbGtpLT5uYW1lLCBuYW1lKSkgewogCQkJZm91bmQgPSB0
cnVlOwogCQkJYnJlYWs7CiAJCX0KLS0gCjIuMzQuMQoK
--------------7Hg0xvlwoG7aMJ0gYxeWQEtZ
Content-Type: text/plain; charset="UTF-8";
	name="0003-ufs-host-ufs-qcom-Fix-ufs_qcom_cfg_timers.patch"
Content-Disposition: attachment;
	filename="0003-ufs-host-ufs-qcom-Fix-ufs_qcom_cfg_timers.patch"
Content-Transfer-Encoding: base64

RnJvbSA3NjU1MTMyYzllNTQzNmE2MzdhZWFmYjI3M2E2MzkyMzYxMjI1MzNhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBDYW4gR3VvIDxxdWljX2NhbmdAcXVpY2luYy5jb20+
CkRhdGU6IFN1biwgMjcgQXByIDIwMjUgMDA6Mzc6MzkgLTA3MDAKU3ViamVjdDogW1BBVENI
IDMvM10gdWZzOiBob3N0OiB1ZnMtcWNvbTogRml4IHVmc19xY29tX2NmZ190aW1lcnMoKQoK
U2lnbmVkLW9mZi1ieTogQ2FuIEd1byA8cXVpY19jYW5nQHF1aWNpbmMuY29tPgotLS0KIGRy
aXZlcnMvdWZzL2hvc3QvdWZzLXFjb20uYyB8IDUxICsrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAyMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Vmcy9ob3N0L3Vmcy1xY29tLmMg
Yi9kcml2ZXJzL3Vmcy9ob3N0L3Vmcy1xY29tLmMKaW5kZXggMzk4Y2MyMWYyY2U0Li5iMmJm
ODAwNzA3MTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdWZzL2hvc3QvdWZzLXFjb20uYworKysg
Yi9kcml2ZXJzL3Vmcy9ob3N0L3Vmcy1xY29tLmMKQEAgLTU0NCwxMyArNTQ0LDE0IEBAIHN0
YXRpYyBpbnQgdWZzX3Fjb21faGNlX2VuYWJsZV9ub3RpZnkoc3RydWN0IHVmc19oYmEgKmhi
YSwKICAqCiAgKiBAaGJhOiBob3N0IGNvbnRyb2xsZXIgaW5zdGFuY2UKICAqIEBpc19wcmVf
c2NhbGVfdXA6IGZsYWcgdG8gY2hlY2sgaWYgcHJlIHNjYWxlIHVwIGNvbmRpdGlvbi4KKyAq
IEBmcmVxOiB0YXJnZXQgb3BwIGZyZXEKICAqIFJldHVybjogemVybyBmb3Igc3VjY2VzcyBh
bmQgbm9uLXplcm8gaW4gY2FzZSBvZiBhIGZhaWx1cmUuCiAgKi8KLXN0YXRpYyBpbnQgdWZz
X3Fjb21fY2ZnX3RpbWVycyhzdHJ1Y3QgdWZzX2hiYSAqaGJhLCBib29sIGlzX3ByZV9zY2Fs
ZV91cCkKK3N0YXRpYyBpbnQgdWZzX3Fjb21fY2ZnX3RpbWVycyhzdHJ1Y3QgdWZzX2hiYSAq
aGJhLCBib29sIGlzX3ByZV9zY2FsZV91cCwgdW5zaWduZWQgbG9uZyBmcmVxKQogewogCXN0
cnVjdCB1ZnNfcWNvbV9ob3N0ICpob3N0ID0gdWZzaGNkX2dldF92YXJpYW50KGhiYSk7CiAJ
c3RydWN0IHVmc19jbGtfaW5mbyAqY2xraTsKLQl1bnNpZ25lZCBsb25nIGNvcmVfY2xrX3Jh
dGUgPSAwOworCXVuc2lnbmVkIGxvbmcgY2xrX2ZyZXEgPSAwOwogCXUzMiBjb3JlX2Nsa19j
eWNsZXNfcGVyX3VzOwogCiAJLyoKQEAgLTU2NCwyMCArNTY1LDMwIEBAIHN0YXRpYyBpbnQg
dWZzX3Fjb21fY2ZnX3RpbWVycyhzdHJ1Y3QgdWZzX2hiYSAqaGJhLCBib29sIGlzX3ByZV9z
Y2FsZV91cCkKIAogCWxpc3RfZm9yX2VhY2hfZW50cnkoY2xraSwgJmhiYS0+Y2xrX2xpc3Rf
aGVhZCwgbGlzdCkgewogCQlpZiAoIXN0cmNtcChjbGtpLT5uYW1lLCAiY29yZV9jbGsiKSkg
ewotCQkJaWYgKGlzX3ByZV9zY2FsZV91cCkKLQkJCQljb3JlX2Nsa19yYXRlID0gY2xraS0+
bWF4X2ZyZXE7Ci0JCQllbHNlCi0JCQkJY29yZV9jbGtfcmF0ZSA9IGNsa19nZXRfcmF0ZShj
bGtpLT5jbGspOworCQkJaWYgKGZyZXEgPT0gVUxPTkdfTUFYKSB7CisJCQkJY2xrX2ZyZXEg
PSBjbGtpLT5tYXhfZnJlcTsKKwkJCQlicmVhazsKKwkJCX0KKworCQkJaWYgKCFoYmEtPnVz
ZV9wbV9vcHApIHsKKwkJCQlpZiAoaXNfcHJlX3NjYWxlX3VwKQorCQkJCQljbGtfZnJlcSA9
IGNsa2ktPm1heF9mcmVxOworCQkJCWVsc2UKKwkJCQkJY2xrX2ZyZXEgPSBjbGtfZ2V0X3Jh
dGUoY2xraS0+Y2xrKTsKKwkJCX0gZWxzZSB7CisJCQkJY2xrX2ZyZXEgPSB1ZnNfcWNvbV9v
cHBfdG9fY2xrX2ZyZXEoaGJhLCBmcmVxLCAiY29yZV9jbGsiKTsKKwkJCX0KKwogCQkJYnJl
YWs7CiAJCX0KIAogCX0KIAogCS8qIElmIGZyZXF1ZW5jeSBpcyBzbWFsbGVyIHRoYW4gMU1I
eiwgc2V0IHRvIDFNSHogKi8KLQlpZiAoY29yZV9jbGtfcmF0ZSA8IERFRkFVTFRfQ0xLX1JB
VEVfSFopCi0JCWNvcmVfY2xrX3JhdGUgPSBERUZBVUxUX0NMS19SQVRFX0haOworCWlmIChj
bGtfZnJlcSA8IERFRkFVTFRfQ0xLX1JBVEVfSFopCisJCWNsa19mcmVxID0gREVGQVVMVF9D
TEtfUkFURV9IWjsKIAotCWNvcmVfY2xrX2N5Y2xlc19wZXJfdXMgPSBjb3JlX2Nsa19yYXRl
IC8gVVNFQ19QRVJfU0VDOworCWNvcmVfY2xrX2N5Y2xlc19wZXJfdXMgPSBjbGtfZnJlcSAv
IFVTRUNfUEVSX1NFQzsKIAlpZiAodWZzaGNkX3JlYWRsKGhiYSwgUkVHX1VGU19TWVMxQ0xL
XzFVUykgIT0gY29yZV9jbGtfY3ljbGVzX3Blcl91cykgewogCQl1ZnNoY2Rfd3JpdGVsKGhi
YSwgY29yZV9jbGtfY3ljbGVzX3Blcl91cywgUkVHX1VGU19TWVMxQ0xLXzFVUyk7CiAJCS8q
CkBAIC01OTcsNyArNjA4LDcgQEAgc3RhdGljIGludCB1ZnNfcWNvbV9saW5rX3N0YXJ0dXBf
bm90aWZ5KHN0cnVjdCB1ZnNfaGJhICpoYmEsCiAKIAlzd2l0Y2ggKHN0YXR1cykgewogCWNh
c2UgUFJFX0NIQU5HRToKLQkJaWYgKHVmc19xY29tX2NmZ190aW1lcnMoaGJhLCBmYWxzZSkp
IHsKKwkJaWYgKHVmc19xY29tX2NmZ190aW1lcnMoaGJhLCBmYWxzZSwgVUxPTkdfTUFYKSkg
ewogCQkJZGV2X2VycihoYmEtPmRldiwgIiVzOiB1ZnNfcWNvbV9jZmdfdGltZXJzKCkgZmFp
bGVkXG4iLAogCQkJCV9fZnVuY19fKTsKIAkJCXJldHVybiAtRUlOVkFMOwpAQCAtODc1LDE3
ICs4ODYsNiBAQCBzdGF0aWMgaW50IHVmc19xY29tX3B3cl9jaGFuZ2Vfbm90aWZ5KHN0cnVj
dCB1ZnNfaGJhICpoYmEsCiAKIAkJYnJlYWs7CiAJY2FzZSBQT1NUX0NIQU5HRToKLQkJaWYg
KHVmc19xY29tX2NmZ190aW1lcnMoaGJhLCBmYWxzZSkpIHsKLQkJCWRldl9lcnIoaGJhLT5k
ZXYsICIlczogdWZzX3Fjb21fY2ZnX3RpbWVycygpIGZhaWxlZFxuIiwKLQkJCQlfX2Z1bmNf
Xyk7Ci0JCQkvKgotCQkJICogd2UgcmV0dXJuIGVycm9yIGNvZGUgYXQgdGhlIGVuZCBvZiB0
aGUgcm91dGluZSwKLQkJCSAqIGJ1dCBjb250aW51ZSB0byBjb25maWd1cmUgVUZTX1BIWV9U
WF9MQU5FX0VOQUJMRQotCQkJICogYW5kIGJ1cyB2b3RpbmcgYXMgdXN1YWwKLQkJCSAqLwot
CQkJcmV0ID0gLUVJTlZBTDsKLQkJfQotCiAJCS8qIGNhY2hlIHRoZSBwb3dlciBtb2RlIHBh
cmFtZXRlcnMgdG8gdXNlIGludGVybmFsbHkgKi8KIAkJbWVtY3B5KCZob3N0LT5kZXZfcmVx
X3BhcmFtcywKIAkJCQlkZXZfcmVxX3BhcmFtcywgc2l6ZW9mKCpkZXZfcmVxX3BhcmFtcykp
OwpAQCAtMTQzNCw3ICsxNDM0LDcgQEAgc3RhdGljIGludCB1ZnNfcWNvbV9jbGtfc2NhbGVf
dXBfcHJlX2NoYW5nZShzdHJ1Y3QgdWZzX2hiYSAqaGJhLCB1bnNpZ25lZCBsb25nIGYKIHsK
IAlpbnQgcmV0OwogCi0JcmV0ID0gdWZzX3Fjb21fY2ZnX3RpbWVycyhoYmEsIHRydWUpOwor
CXJldCA9IHVmc19xY29tX2NmZ190aW1lcnMoaGJhLCB0cnVlLCBmcmVxKTsKIAlpZiAocmV0
KSB7CiAJCWRldl9lcnIoaGJhLT5kZXYsICIlcyB1ZnMgY2ZnIHRpbWVyIGZhaWxlZFxuIiwg
X19mdW5jX18pOwogCQlyZXR1cm4gcmV0OwpAQCAtMTQ3MSw2ICsxNDcxLDEzIEBAIHN0YXRp
YyBpbnQgdWZzX3Fjb21fY2xrX3NjYWxlX2Rvd25fcHJlX2NoYW5nZShzdHJ1Y3QgdWZzX2hi
YSAqaGJhKQogCiBzdGF0aWMgaW50IHVmc19xY29tX2Nsa19zY2FsZV9kb3duX3Bvc3RfY2hh
bmdlKHN0cnVjdCB1ZnNfaGJhICpoYmEsIHVuc2lnbmVkIGxvbmcgZnJlcSkKIHsKKwlpbnQg
cmV0OworCisJcmV0ID0gdWZzX3Fjb21fY2ZnX3RpbWVycyhoYmEsIGZhbHNlLCBmcmVxKTsK
KwlpZiAocmV0KSB7CisJCWRldl9lcnIoaGJhLT5kZXYsICIlczogdWZzX3Fjb21fY2ZnX3Rp
bWVycygpIGZhaWxlZFxuIiwJX19mdW5jX18pOworCQlyZXQgPSAtRUlOVkFMOworCX0KIAkv
KiBzZXQgdW5pcHJvIGNvcmUgY2xvY2sgYXR0cmlidXRlcyBhbmQgY2xlYXIgY2xvY2sgZGl2
aWRlciAqLwogCXJldHVybiB1ZnNfcWNvbV9zZXRfY29yZV9jbGtfY3RybChoYmEsIGZhbHNl
LCBmcmVxKTsKIH0KLS0gCjIuMzQuMQoK

--------------7Hg0xvlwoG7aMJ0gYxeWQEtZ--

