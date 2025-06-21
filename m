Return-Path: <linux-arm-msm+bounces-61941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E759BAE2A7B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 19:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26DA8189980A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 17:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD73F189902;
	Sat, 21 Jun 2025 17:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UWg6onVo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116BE1624EA;
	Sat, 21 Jun 2025 17:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750526192; cv=none; b=u5cHHb3McTkdAGBmL8vGCYYat+E3w+ULtDjc1MFMI7aMkq/8bu1PPAPnRZh7OUNRfoPE+aQYH+ohDPnAPksre+epjBIhEr8LruiZKqZpgjkbEZKq1WB9sSp2XfXi+T6daQy+vn3cWdf7WHs+YesUaMsPX6/9wcjjeYLGZiCias4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750526192; c=relaxed/simple;
	bh=WdYjSmwJ75G3ptkBKzWUoLdXsaZpab0x5plIXv6ukEw=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:CC:
	 References:From:In-Reply-To; b=hGCyKKVrmmqMzNFHbCybejdzorWuo9N3jY1SybNnHvAb06FY//MzdvwekDZAQ8AtgcNnOyjG7nXNXg83Rtj0grTKJ9onBIABfTrtZCgGpeAw95b8q/AoUE/aefmriWMzcqMI4vj3Zw6ZnBJoVSKxSFRL/ZCex6kkvBFRKZuDwEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UWg6onVo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LFDpnY006375;
	Sat, 21 Jun 2025 17:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8uQBlmo30bqBjXdsNkTv/gJ6
	are8bjp9rRn9JhNcWiM=; b=UWg6onVoDGBXZbsDi34Xj7kp/W0qFPkmtvJPgbYj
	pgua2y7NRJ7MTY+gjb5p4frZ1erCr2KTcnTJzTS34slPXOcJIdlMWesC+DikeKe3
	L1+jaewM6uGeQ7K7NneOTEP44tWUorAMsV/7DXtaDJCY36qaB8RSW4Q2X73wP3yY
	UGkdq+3gH0lMiYtZq5xE8RHgMEeDe5qMcWgUGNy0nUi2QH9kFJOXEz0f4SQzZA8C
	xzm6+gcJZq89SNZt1lKw1oogC/cfAXFN+iXxzLDNpg81B3nnQbmPwVqqbmKKLNRl
	gbiG6D9XTTlx4EICaro49DIH9WGDU2yzU3UbiJViyUn6Eg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47du0x0dpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Jun 2025 17:16:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55LHG7Gj008313
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Jun 2025 17:16:07 GMT
Received: from [10.216.13.113] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 21 Jun
 2025 10:16:01 -0700
Content-Type: multipart/mixed;
	boundary="------------Da0V0ck15j1W3qt0hMbzwM0N"
Message-ID: <7e362ee3-a237-4583-97fe-69ffc0d1d90d@quicinc.com>
Date: Sat, 21 Jun 2025 22:45:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 10/10] scsi: ufs: qcom : Refactor phy_power_on/off
 calls
To: Aishwarya <aishwarya.tcv@arm.com>
CC: <James.Bottomley@HansenPartnership.com>, <andersson@kernel.org>,
        <bvanassche@acm.org>, <dmitry.baryshkov@oss.qualcomm.com>,
        <kishon@kernel.org>, <konrad.dybcio@oss.qualcomm.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-scsi@vger.kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <martin.petersen@oracle.com>,
        <neil.armstrong@linaro.org>, <quic_cang@quicinc.com>,
        <quic_rdwivedi@quicinc.com>, <vkoul@kernel.org>, <broonie@kernel.org>
References: <9c846734-9267-442d-bba0-578d993650c1@quicinc.com>
 <20250620214408.11028-1-aishwarya.tcv@arm.com>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <20250620214408.11028-1-aishwarya.tcv@arm.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BBgAG4L-SZ6R_xd46fwJubdJZ8p0ZAAV
X-Authority-Analysis: v=2.4 cv=fYqty1QF c=1 sm=1 tr=0 ts=6856e8d8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=VcYpPVACYBiYVGcob_UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=09waTpoc23FLKGTpX6IA:9
 a=B2y7HmGcmWMA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDEwOSBTYWx0ZWRfX4RbztmE39TiY
 r/bYabi1sVGpv41mlV8Cfs4apNGquFVhxWI3++PdklMF9x0T98vpfYxn6mg5X3O/HtSxP43deaa
 i+QmlhLg7hNOO6AADJjf6wjHG91DYIu2GyDWdIG7nhmOjmQsjLTbLb79F05vQggRawhHcE2LHcY
 lnU69yq+abgZutAY4SIlq7uYmdz1rkJAFwulvQLBMu+5AChmLKEK4rT8vdVh89nnAfHUty/P3va
 xbsJ8dktxUuWavOsA0Q0prLtxHB1v8eQxDtYZ8wHBgRA3BVrJ8R+1UmzETD9nKguOqDWYTuUNKY
 uW6KByXL7AyPSw0VCv1/I/1pfYuu7FP9l4rjDujCS0Yedt7ZPGQv0XnTXRLIF1AxZHzIIH7LJTv
 7zO3KGXbxl7jtKtT8r3SrXRgJoqsWfak7q5x/kwCxe+IiLQUiCGWtQ5PzSwUqqqdaVaEC7AP
X-Proofpoint-ORIG-GUID: BBgAG4L-SZ6R_xd46fwJubdJZ8p0ZAAV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506210109

--------------Da0V0ck15j1W3qt0hMbzwM0N
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 6/21/2025 3:14 AM, Aishwarya wrote:
> Hi Nitin,
> 
> To clarify — the defconfig kernel does boot successfully on our Arm64
> Qualcomm platforms (RB5 and DB845C). However, starting from
> next-20250613, we are seeing the following three test failures in the
> `bootrr` baseline test in our CI environment:
> 
>    - baseline.bootrr.scsi-disk-device0-probed
>    - dmesg.alert
>    - dmesg.emerg
> 

Hi Aishwarya,

Thanks for testing and reporting this issue. Can you please
test with the attached fix and let me know if it helps.

Regards,
Nitin

> Test suite:
>    https://github.com/kernelci/bootrr/tree/main
> 
> These failures are due to kernel alerts seen in the boot logs. A relevant
> snippet is shown below:
> 
>    kern  :alert : Unable to handle kernel NULL pointer dereference at
>    virtual address 0000000000000000
>    kern  :alert : Mem abort info:
>    kern  :alert :   ESR = 0x0000000096000004
>    kern  :alert :   EC = 0x25: DABT (current EL), IL = 32 bits
>    kern  :alert :   SET = 0, FnV = 0
>    kern  :alert :   EA = 0, S1PTW = 0
>    kern  :alert :   FSC = 0x04: level 0 translation fault
>    kern  :alert : Data abort info:
>    kern  :alert :   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
>    kern  :alert :   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>    kern  :alert :   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>    kern  :alert : user pgtable: 4k pages, 48-bit VAs, pgdp=0000000109c41000
>    kern  :alert : [0000000000000000] pgd=0000000000000000
>    <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=alert RESULT=fail UNITS=lines
>    MEASUREMENT=13>
> 
>    kern  :emerg : Internal error: Oops: 0000000096000004 [#1] SMP
>    kern  :emerg : Code: a90157f3 aa0003f3 f90013f6 f9405c15 (f94002b6)
>    <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=emerg RESULT=fail UNITS=lines
>    MEASUREMENT=2>
> 
> Please let me know if you need full logs or further details to help
> with debugging.
> 
> Thanks,
> Aishwarya

--------------Da0V0ck15j1W3qt0hMbzwM0N
Content-Type: text/plain; charset="UTF-8";
	name="0001-scsi-ufs-qcom-Fix-NULL-pointer-dereference-in-ufs_qc.patch"
Content-Disposition: attachment;
	filename*0="0001-scsi-ufs-qcom-Fix-NULL-pointer-dereference-in-ufs_qc.pa";
	filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAzZjZhYmYwZjVhMWFkNmRiYTk3NTgyNGM5N2M5NGE3N2JhYmI5ZDM4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBOaXRpbiBSYXdhdCA8cXVpY19uaXRpcmF3YUBxdWlj
aW5jLmNvbT4KRGF0ZTogU2F0LCAyMSBKdW4gMjAyNSAyMTo0MDo0MiArMDUzMApTdWJqZWN0
OiBbUEFUQ0ggVjFdIHNjc2k6IHVmczogcWNvbSA6IEZpeCBOVUxMIHBvaW50ZXIgZGVyZWZl
cmVuY2UgaW4KIHVmc19xY29tX3NldHVwX2Nsb2NrcwoKRml4IGEgTlVMTCBwb2ludGVyIGRl
cmVmZXJlbmNlIGluIHVmc19xY29tX3NldHVwX2Nsb2NrcyBkdWUgdG8gYW4KdW5pbml0aWFs
aXplZCAnaG9zdCcgdmFyaWFibGUuIFRoZSB2YXJpYWJsZSAncGh5JyBpcyBub3cgYXNzaWdu
ZWQKYWZ0ZXIgY29uZmlybWluZyAnaG9zdCcgaXMgbm90IE5VTEwuCgpDYWxsIFN0YWNrOgoK
WyAgICA2LjQ0ODA3MF0gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRl
cmVmZXJlbmNlIGF0CnZpcnR1YWwgYWRkcmVzcyAwMDAwMDAwMDAwMDAwMDAwClsgICAgNi40
NDg0NDldIHVmc19xY29tX3NldHVwX2Nsb2NrcysweDI4LzB4MTQ4IHVmc19xY29tIChQKQpb
ICAgIDYuNDQ4NDY2XSB1ZnNoY2Rfc2V0dXBfY2xvY2tzIChkcml2ZXJzL3Vmcy9jb3JlL3Vm
c2hjZC1wcml2Lmg6MTQyKQpbICAgIDYuNDQ4NDc3XSB1ZnNoY2RfaW5pdCAoZHJpdmVycy91
ZnMvY29yZS91ZnNoY2QuYzo5NDY4KQpbICAgIDYuNDQ4NDg1XSB1ZnNoY2RfcGx0ZnJtX2lu
aXQgKGRyaXZlcnMvdWZzL2hvc3QvdWZzaGNkLXBsdGZybS5jOjUwNCkKWyAgICA2LjQ0ODQ5
NV0gdWZzX3Fjb21fcHJvYmUrMHgyOC8weDY4IHVmc19xY29tClsgICAgNi40NDg1MDhdIHBs
YXRmb3JtX3Byb2JlIChkcml2ZXJzL2Jhc2UvcGxhdGZvcm0uYzoxNDA0KQpbICAgIDYuNDQ4
NTE5XSByZWFsbHlfcHJvYmUgKGRyaXZlcnMvYmFzZS9kZC5jOjU3OSBkcml2ZXJzL2Jhc2Uv
ZGQuYzo2NTcpClsgICAgNi40NDg1MjZdIF9fZHJpdmVyX3Byb2JlX2RldmljZSAoZHJpdmVy
cy9iYXNlL2RkLmM6Nzk5KQpbICAgIDYuNDQ4NTMyXSBkcml2ZXJfcHJvYmVfZGV2aWNlIChk
cml2ZXJzL2Jhc2UvZGQuYzo4MjkpClsgICAgNi40NDg1MzldIF9fZHJpdmVyX2F0dGFjaCAo
ZHJpdmVycy9iYXNlL2RkLmM6MTIxNikKWyAgICA2LjQ0ODU0NV0gYnVzX2Zvcl9lYWNoX2Rl
diAoZHJpdmVycy9iYXNlL2J1cy5jOjM3MCkKWyAgICA2LjQ0ODU1Nl0gZHJpdmVyX2F0dGFj
aCAoZHJpdmVycy9iYXNlL2RkLmM6MTIzNCkKWyAgICA2LjQ0ODU2N10gYnVzX2FkZF9kcml2
ZXIgKGRyaXZlcnMvYmFzZS9idXMuYzo2NzgpClsgICAgNi40NDg1NzddIGRyaXZlcl9yZWdp
c3RlciAoZHJpdmVycy9iYXNlL2RyaXZlci5jOjI0OSkKWyAgICA2LjQ0ODU4NF0gX19wbGF0
Zm9ybV9kcml2ZXJfcmVnaXN0ZXIgKGRyaXZlcnMvYmFzZS9wbGF0Zm9ybS5jOjg2OCkKWyAg
ICA2LjQ0ODU5Ml0gdWZzX3Fjb21fcGx0Zm9ybV9pbml0KzB4MjgvMHhmZjggdWZzX3Fjb20K
WyAgICA2LjQ0ODYwNV0gZG9fb25lX2luaXRjYWxsIChpbml0L21haW4uYzoxMjc0KQpbICAg
IDYuNDQ4NjE1XSBkb19pbml0X21vZHVsZSAoa2VybmVsL21vZHVsZS9tYWluLmM6MzA0MSkK
WyAgICA2LjQ0ODYyNl0gbG9hZF9tb2R1bGUgKGtlcm5lbC9tb2R1bGUvbWFpbi5jOjM1MTEp
ClsgICAgNi40NDg2MzVdIGluaXRfbW9kdWxlX2Zyb21fZmlsZSAoa2VybmVsL21vZHVsZS9t
YWluLmM6MzcwNCkKWyAgICA2LjQ0ODY0NF0gX19hcm02NF9zeXNfZmluaXRfbW9kdWxlIChr
ZXJuZWwvbW9kdWxlL21haW4uYzozNzE1LgoKRml4ZXM6IDc3ZDJmYTU0YTk0NSAoInNjc2k6
IHVmczogcWNvbSA6IFJlZmFjdG9yIHBoeV9wb3dlcl9vbi9vZmYgY2FsbHMiKQpSZXBvcnRl
ZC1ieTogQWlzaHdhcnlhIDxhaXNod2FyeWEudGN2QGFybS5jb20+CkNsb3NlczogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI1MDYyMDIxNDQwOC4xMTAyOC0xLWFpc2h3YXJ5
YS50Y3ZAYXJtLmNvbS8KUmVwb3J0ZWQtYnk6IE5hcmVzaCBLYW1ib2p1IDxuYXJlc2gua2Ft
Ym9qdUBsaW5hcm8ub3JnPgpDbG9zZXM6IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDI1LzYv
MjEvMTA3CkNvLWRldmVsb3BlZC1ieTogUmFtIEt1bWFyIER3aXZlZGkgPHF1aWNfcmR3aXZl
ZGlAcXVpY2luYy5jb20+ClNpZ25lZC1vZmYtYnk6IFJhbSBLdW1hciBEd2l2ZWRpIDxxdWlj
X3Jkd2l2ZWRpQHF1aWNpbmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBOaXRpbiBSYXdhdCA8cXVp
Y19uaXRpcmF3YUBxdWljaW5jLmNvbT4KLS0tCiBkcml2ZXJzL3Vmcy9ob3N0L3Vmcy1xY29t
LmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Vmcy9ob3N0L3Vmcy1xY29tLmMgYi9kcml2
ZXJzL3Vmcy9ob3N0L3Vmcy1xY29tLmMKaW5kZXggYmE0YjI4ODAyNzljLi4zMThkY2E3ZmUz
ZDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdWZzL2hvc3QvdWZzLXFjb20uYworKysgYi9kcml2
ZXJzL3Vmcy9ob3N0L3Vmcy1xY29tLmMKQEAgLTExMjQsNyArMTEyNCw3IEBAIHN0YXRpYyBp
bnQgdWZzX3Fjb21fc2V0dXBfY2xvY2tzKHN0cnVjdCB1ZnNfaGJhICpoYmEsIGJvb2wgb24s
CiAJCQkJIGVudW0gdWZzX25vdGlmeV9jaGFuZ2Vfc3RhdHVzIHN0YXR1cykKIHsKIAlzdHJ1
Y3QgdWZzX3Fjb21faG9zdCAqaG9zdCA9IHVmc2hjZF9nZXRfdmFyaWFudChoYmEpOwotCXN0
cnVjdCBwaHkgKnBoeSA9IGhvc3QtPmdlbmVyaWNfcGh5OworCXN0cnVjdCBwaHkgKnBoeTsK
IAlpbnQgZXJyOwoKIAkvKgpAQCAtMTEzNSw2ICsxMTM1LDggQEAgc3RhdGljIGludCB1ZnNf
cWNvbV9zZXR1cF9jbG9ja3Moc3RydWN0IHVmc19oYmEgKmhiYSwgYm9vbCBvbiwKIAlpZiAo
IWhvc3QpCiAJCXJldHVybiAwOwoKKwlwaHkgPSBob3N0LT5nZW5lcmljX3BoeTsKKwogCXN3
aXRjaCAoc3RhdHVzKSB7CiAJY2FzZSBQUkVfQ0hBTkdFOgogCQlpZiAob24pIHsKLS0KMi40
OC4xCgo=

--------------Da0V0ck15j1W3qt0hMbzwM0N--

