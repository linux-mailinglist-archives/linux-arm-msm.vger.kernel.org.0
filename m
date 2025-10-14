Return-Path: <linux-arm-msm+bounces-77096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E52B9BD78EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 08:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AFE524E06C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 06:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D8527F747;
	Tue, 14 Oct 2025 06:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n1hlUsNG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0211523817D;
	Tue, 14 Oct 2025 06:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760423103; cv=none; b=Ikh3wNaw863PICBluiWhxSnMS8kAlecdvkFOI1AvfZhzVvqZQ+y/QJ9Jnr+sJBO7nM0IP1gcwXQQNx6+bUfy0zp3e134+Y/8/Zg4Mvu7cXjDirWcN8h1ZG0DX/n7YECqQYW6b+8065vkTGin2IK2B1XGFcxwa9galyEgWL0KtXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760423103; c=relaxed/simple;
	bh=GhlJYGC0R/VVAmVQObZvDk3+T4+plyGmbCK61IY0EK8=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:CC:
	 References:From:In-Reply-To; b=e+UG6jT8wtFS68piPYqE1Yd/LRf9rpoRLkm6uFe86B9V6BYsD1zipuKdWR1/ydT/m4CCQ1cX4coWHGVBCxKWlnKaAIULoIDGX5//d04zJIBsGnABe9DOEP1OHJvQNBObckY4amTyQWQBOnC1aqAzIRazcWLz8BfG9WyYUXW1lH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n1hlUsNG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DIMMR1024035;
	Tue, 14 Oct 2025 06:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jn7CG5Z3B79+lNjQKbuRth7H
	TAQeTWOPNe84FKD0kBQ=; b=n1hlUsNG6mFwzOWGOF5+MWZHNdM9j5FuyjNLF4Ut
	MHPedXHXUY7jaB0aN80UHh56etZn6rSlJ7P+LzdW7N2DW3etDy45RnV/4e2aEobP
	GwjGzxjb77W+TIXOB53x5oUpC4396pblSx5fwYzrB6fJiL5hnEXOboC/RhaK9kLt
	hD4z3HzjLPitiD97+u47MR7enrMNJ3ta/boTGmu4/jsCw3eqJWJQEZn2AyLKWv9N
	un3XxCRxuuq4OWooHWMWTBB10FI/uvaUIUVZda0hHeNXIQTCctSmqDub4OjWEFCH
	Tb4ruScnAfmE6daRt85yRcKxHrZW3ypU/zGfuJk11RbBMA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwhnwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 06:24:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59E6Og6o006633
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 06:24:42 GMT
Received: from [10.206.97.61] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 13 Oct
 2025 23:24:35 -0700
Content-Type: multipart/mixed;
	boundary="------------A0IZRVvHwU5LlAeVdmwBKEmr"
Message-ID: <374098ea-23f1-4d1a-8f70-313a7e384f8d@quicinc.com>
Date: Tue, 14 Oct 2025 11:54:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <marijn.suijten@somainline.org>,
        <andersson@kernel.org>, <robh@kernel.org>, <robh+dt@kernel.org>,
        <krzk+dt@kernel.org>, <konradybcio@kernel.org>, <conor+dt@kernel.org>,
        <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
        <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
        <jonathan@marek.ca>, <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <quic_rajeevny@quicinc.com>, <quic_vproddut@quicinc.com>
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-7-quic_amakhija@quicinc.com>
 <fsqytqhe72bgmloyzm6khoprq6bysf52ufz6oi6epos7uadyho@wg4rxs6f2xyl>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <fsqytqhe72bgmloyzm6khoprq6bysf52ufz6oi6epos7uadyho@wg4rxs6f2xyl>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX9eHTEK3lxYH9
 OSOPQGnVnNNE9rZl04IP63anoHOsIWZALCA6KSQ3Xf9pVZ9z53r41M/k1Zz3Qb7m46rmVDJsWyP
 MhHExJhYbgJiu9IoRr5lhoq/1KXjJ1LqGk5AFCPvy0mpjDjYR3Rs6Pqr8jsRU4wGCXXP44FwiUb
 LFX0/kDVSqunBucV3MjpaOu+kizrIu3Y7i18/FGJKYNKzqwwOeIhFgZIyr1FGq3EsGvjrbxwCxC
 gn/hNvdue4/JPPUW6HofK+efq6bYtXx3fK8MSYnYKzA7idXvZ1b1JO5zWJT6kXbzIeht+xtSf1j
 W/K1zyQgz+3gxGHY4PDmByHlHwU7RJejXLOP/N+gVXfoR6lPU46lKm4se4sOUHSmjvng38fvRBE
 OrLIrBKLW/ZJsJ9buYzlk7bzWM+JGw==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68edecab cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=Fs7R63aNY1v5aSNtnsIA:9 a=QEXdDO2ut3YA:10
 a=pD-t-wKbIgpBmJTf4s8A:9 a=o8tIzjTAyhEnLtqR:21 a=_W_S_7VecoQA:10
 a=L03L2QfmqWoA:10 a=1WNtSb5ECZgA:10 a=aVE1WBiKv9EA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-GUID: FM-SxAmSvPX98ik1YFjTUbT6YXSEN9O8
X-Proofpoint-ORIG-GUID: FM-SxAmSvPX98ik1YFjTUbT6YXSEN9O8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083

--------------A0IZRVvHwU5LlAeVdmwBKEmr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 10/6/2025 3:44 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 06, 2025 at 07:09:23AM +0530, Ayushi Makhija wrote:
>> Add device tree nodes for the DSI0 controller with their corresponding
>> PHY found on Qualcomm QCS8300 SoC.
>>
>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 98 ++++++++++++++++++++++++++-
>>  1 file changed, 97 insertions(+), 1 deletion(-)
>>
>> +
>> +				mdss_dsi_opp_table: opp-table {
>> +					compatible = "operating-points-v2";
>> +
>> +					opp-358000000 {
>> +						opp-hz = /bits/ 64 <358000000>;
>> +						required-opps = <&rpmhpd_opp_svs_l1>;
>> +					};
> 
> Does it really support only a single freq?
> 

Hi Dmitry, yes it support only single opp frequency, I got this information from ipcat sw for monaco, similar
we have used for LeMans.

Thanks,
Ayushi


--------------A0IZRVvHwU5LlAeVdmwBKEmr
Content-Type: text/html; charset="UTF-8";
	name="https://elixir.bootlin.com/linux/v6.17/source/arch/arm64/boot/dts/qcom/sa8775p.dtsi#L4541"
Content-Disposition: attachment;
	filename*0="https://elixir.bootlin.com/linux/v6.17/source/arch/arm64/boo";
	filename*1="t/dts/qcom/sa8775p.dtsi#L4541"
Content-Location: https://elixir.bootlin.com/linux/v6.17/source/arch/arm64/boot/dts/qcom/sa8775p.dtsi#L4541
Content-Transfer-Encoding: base64

PCFkb2N0eXBlIGh0bWw+PGh0bWwgbGFuZz0iZW4iPjxoZWFkPjx0aXRsZT5NYWtpbmcgc3Vy
ZSB5b3UmIzM5O3JlIG5vdCBhIGJvdCE8L3RpdGxlPjxsaW5rIHJlbD0ic3R5bGVzaGVldCIg
aHJlZj0iLy53aXRoaW4ud2Vic2l0ZS94L3hlc3MveGVzcy5taW4uY3NzP2NhY2hlYnVzdGVy
PXYxLjIxLjAtcHJlMSI+PG1ldGEgbmFtZT0idmlld3BvcnQiIGNvbnRlbnQ9IndpZHRoPWRl
dmljZS13aWR0aCwgaW5pdGlhbC1zY2FsZT0xLjAiPjxtZXRhIG5hbWU9InJvYm90cyIgY29u
dGVudD0ibm9pbmRleCxub2ZvbGxvdyI+PHN0eWxlPgogICAgICAgIGJvZHksCiAgICAgICAg
aHRtbCB7CiAgICAgICAgICAgIGhlaWdodDogMTAwJTsKICAgICAgICAgICAgZGlzcGxheTog
ZmxleDsKICAgICAgICAgICAganVzdGlmeS1jb250ZW50OiBjZW50ZXI7CiAgICAgICAgICAg
IGFsaWduLWl0ZW1zOiBjZW50ZXI7CiAgICAgICAgICAgIG1hcmdpbi1sZWZ0OiBhdXRvOwog
ICAgICAgICAgICBtYXJnaW4tcmlnaHQ6IGF1dG87CiAgICAgICAgfQoKICAgICAgICAuY2Vu
dGVyZWQtZGl2IHsKICAgICAgICAgICAgdGV4dC1hbGlnbjogY2VudGVyOwogICAgICAgIH0K
CiAgICAgICAgI3N0YXR1cyB7CiAgICAgICAgICAgIGZvbnQtdmFyaWFudC1udW1lcmljOiB0
YWJ1bGFyLW51bXM7CiAgICAgICAgfQoKICAgICAgICAjcHJvZ3Jlc3MgewogICAgICAgICAg
ZGlzcGxheTogbm9uZTsKICAgICAgICAgIHdpZHRoOiA5MCU7CiAgICAgICAgICB3aWR0aDog
bWluKDIwcmVtLCA5MCUpOwogICAgICAgICAgaGVpZ2h0OiAycmVtOwogICAgICAgICAgYm9y
ZGVyLXJhZGl1czogMXJlbTsKICAgICAgICAgIG92ZXJmbG93OiBoaWRkZW47CiAgICAgICAg
ICBtYXJnaW46IDFyZW0gMCAycmVtOwoJCQkJCW91dGxpbmUtb2Zmc2V0OiAycHg7CgkJCQkJ
b3V0bGluZTogI2IxNjI4NiBzb2xpZCA0cHg7CgkJCQl9CgogICAgICAgIC5iYXItaW5uZXIg
ewogICAgICAgICAgICBiYWNrZ3JvdW5kLWNvbG9yOiAjYjE2Mjg2OwogICAgICAgICAgICBo
ZWlnaHQ6IDEwMCU7CiAgICAgICAgICAgIHdpZHRoOiAwOwogICAgICAgICAgICB0cmFuc2l0
aW9uOiB3aWR0aCAwLjI1cyBlYXNlLWluOwogICAgICAgIH0KICAgIAk8L3N0eWxlPjxzY3Jp
cHQgaWQ9ImFudWJpc192ZXJzaW9uIiB0eXBlPSJhcHBsaWNhdGlvbi9qc29uIj4idjEuMjEu
MC1wcmUxIgo8L3NjcmlwdD48c2NyaXB0IGlkPSJhbnViaXNfY2hhbGxlbmdlIiB0eXBlPSJh
cHBsaWNhdGlvbi9qc29uIj57InJ1bGVzIjp7ImFsZ29yaXRobSI6ImZhc3QiLCJkaWZmaWN1
bHR5Ijo0LCJyZXBvcnRfYXMiOjR9LCJjaGFsbGVuZ2UiOiI1ZjQyM2Q1Njc3YTNhNDAzNTBh
OTUwZDZkMmM0MmRjNGEwODgwNTNmNTZjODA4MWExZWMzMDQxZjY5MDA3NWYzMDMzNjg3Y2Fi
Y2E2Mzk3YTY1OGI2NjZiNzExOGVjZWE5YzdkZmYxNGM5NWVjZTRlODEwYTIyNTRhZjc3YzFj
NDM5NmY3ZDVmMTQxNGU3MzgwY2MxYjdlNDZmZmQxZmQ2NzZhODJmMmU1OWMxYWIzMTQwMWY5
OTE1OWY3YzRjMGRmMDUzM2RlZGM4NmQ4NzFmMDJkOGJkMmI5NDRkNDhiNzg5MmMwOGY1ODcz
MzMyMDVhOTk5MGYwNWZkOGZiNWQ3MzQ5OTU0Nzg5Yjg5MmIwODYyNWYzZTBjZGY5ZGFhZGMy
Yzc4YzkzYjE3ZDJmNTJhZjM1NTliZWM1MGU1NzViMDFiMjM0YjMyMDYxZDIzZmFmYzdmOTU3
YjcyOTI1NTFiYzliNGMzNmRkZjhhODcwMWZjZjRjZDE1ZDMxODc0ZGZhMmUzYzFiMDVjYmZk
YTQ0ZDFjMzU4OTkwZGViN2NhYjIyMGQ4MzhmNmRkMjA0Y2U1NWQyZmE5MTIxNjdiOWZiZDE2
MmE2YjY2NGM1MDNhMDc3MDE5NGVlOWUwN2RjNTRhNTUxZjNhZTk2MmE0MGQ2MmFkMmQ3MmNm
NzFmZmUwNSJ9Cjwvc2NyaXB0PjxzY3JpcHQgaWQ9ImFudWJpc19iYXNlX3ByZWZpeCIgdHlw
ZT0iYXBwbGljYXRpb24vanNvbiI+IiIKPC9zY3JpcHQ+PC9oZWFkPjxib2R5IGlkPSJ0b3Ai
PjxtYWluPjxjZW50ZXI+PGgxIGlkPSJ0aXRsZSIgY2xhc3M9Ii5jZW50ZXJlZC1kaXYiPk1h
a2luZyBzdXJlIHlvdSYjMzk7cmUgbm90IGEgYm90ITwvaDE+PC9jZW50ZXI+PGRpdiBjbGFz
cz0iY2VudGVyZWQtZGl2Ij48aW1nIGlkPSJpbWFnZSIgc3R5bGU9IndpZHRoOjEwMCU7bWF4
LXdpZHRoOjI1NnB4OyIgc3JjPSIvLndpdGhpbi53ZWJzaXRlL3gvY21kL2FudWJpcy9zdGF0
aWMvaW1nL3BlbnNpdmUud2VicD9jYWNoZUJ1c3Rlcj12MS4yMS4wLXByZTEiPiA8aW1nIHN0
eWxlPSJkaXNwbGF5Om5vbmU7IiBzdHlsZT0id2lkdGg6MTAwJTttYXgtd2lkdGg6MjU2cHg7
IiBzcmM9Ii8ud2l0aGluLndlYnNpdGUveC9jbWQvYW51YmlzL3N0YXRpYy9pbWcvaGFwcHku
d2VicD9jYWNoZUJ1c3Rlcj12MS4yMS4wLXByZTEiPjxwIGlkPSJzdGF0dXMiPkxvYWRpbmcu
Li48L3A+PHNjcmlwdCBhc3luYyB0eXBlPSJtb2R1bGUiIHNyYz0iLy53aXRoaW4ud2Vic2l0
ZS94L2NtZC9hbnViaXMvc3RhdGljL2pzL21haW4ubWpzP2NhY2hlQnVzdGVyPXYxLjIxLjAt
cHJlMSI+PC9zY3JpcHQ+PGRpdiBpZD0icHJvZ3Jlc3MiIHJvbGU9InByb2dyZXNzYmFyIiBh
cmlhLWxhYmVsbGVkYnk9InN0YXR1cyI+PGRpdiBjbGFzcz0iYmFyLWlubmVyIj48L2Rpdj48
L2Rpdj48ZGV0YWlscz48c3VtbWFyeT5XaHkgYW0gSSBzZWVpbmcgdGhpcz88L3N1bW1hcnk+
PHA+WW91IGFyZSBzZWVpbmcgdGhpcyBiZWNhdXNlIHRoZSBhZG1pbmlzdHJhdG9yIG9mIHRo
aXMgd2Vic2l0ZSBoYXMgc2V0IHVwIEFudWJpcyB0byBwcm90ZWN0IHRoZSBzZXJ2ZXIgYWdh
aW5zdCB0aGUgc2NvdXJnZSBvZiBBSSBjb21wYW5pZXMgYWdncmVzc2l2ZWx5IHNjcmFwaW5n
IHdlYnNpdGVzLiBUaGlzIGNhbiBhbmQgZG9lcyBjYXVzZSBkb3dudGltZSBmb3IgdGhlIHdl
YnNpdGVzLCB3aGljaCBtYWtlcyB0aGVpciByZXNvdXJjZXMgaW5hY2Nlc3NpYmxlIGZvciBl
dmVyeW9uZS48L3A+PHA+QW51YmlzIGlzIGEgY29tcHJvbWlzZS4gQW51YmlzIHVzZXMgYSBQ
cm9vZi1vZi1Xb3JrIHNjaGVtZSBpbiB0aGUgdmVpbiBvZiBIYXNoY2FzaCwgYSBwcm9wb3Nl
ZCBwcm9vZi1vZi13b3JrIHNjaGVtZSBmb3IgcmVkdWNpbmcgZW1haWwgc3BhbS4gVGhlIGlk
ZWEgaXMgdGhhdCBhdCBpbmRpdmlkdWFsIHNjYWxlcyB0aGUgYWRkaXRpb25hbCBsb2FkIGlz
IGlnbm9yYWJsZSwgYnV0IGF0IG1hc3Mgc2NyYXBlciBsZXZlbHMgaXQgYWRkcyB1cCBhbmQg
bWFrZXMgc2NyYXBpbmcgbXVjaCBtb3JlIGV4cGVuc2l2ZS48L3A+PHA+VWx0aW1hdGVseSwg
dGhpcyBpcyBhIGhhY2sgd2hvc2UgcmVhbCBwdXJwb3NlIGlzIHRvIGdpdmUgYSAmIzM0O2dv
b2QgZW5vdWdoJiMzNDsgcGxhY2Vob2xkZXIgc29sdXRpb24gc28gdGhhdCBtb3JlIHRpbWUg
Y2FuIGJlIHNwZW50IG9uIGZpbmdlcnByaW50aW5nIGFuZCBpZGVudGlmeWluZyBoZWFkbGVz
cyBicm93c2VycyAoRUc6IHZpYSBob3cgdGhleSBkbyBmb250IHJlbmRlcmluZykgc28gdGhh
dCB0aGUgY2hhbGxlbmdlIHByb29mIG9mIHdvcmsgcGFnZSBkb2VzbiYjMzk7dCBuZWVkIHRv
IGJlIHByZXNlbnRlZCB0byB1c2VycyB0aGF0IGFyZSBtdWNoIG1vcmUgbGlrZWx5IHRvIGJl
IGxlZ2l0aW1hdGUuPC9wPjxwPlBsZWFzZSBub3RlIHRoYXQgQW51YmlzIHJlcXVpcmVzIHRo
ZSB1c2Ugb2YgbW9kZXJuIEphdmFTY3JpcHQgZmVhdHVyZXMgdGhhdCBwbHVnaW5zIGxpa2Ug
SlNoZWx0ZXIgd2lsbCBkaXNhYmxlLiBQbGVhc2UgZGlzYWJsZSBKU2hlbHRlciBvciBvdGhl
ciBzdWNoIHBsdWdpbnMgZm9yIHRoaXMgZG9tYWluLjwvcD48cD5UaGlzIHdlYnNpdGUgaXMg
cnVubmluZyBBbnViaXMgdmVyc2lvbiA8Y29kZT52MS4yMS4wLXByZTE8L2NvZGU+LjwvcD48
L2RldGFpbHM+PG5vc2NyaXB0PjxwPlNhZGx5LCB5b3UgbXVzdCBlbmFibGUgSmF2YVNjcmlw
dCB0byBnZXQgcGFzdCB0aGlzIGNoYWxsZW5nZS4gVGhpcyBpcyByZXF1aXJlZCBiZWNhdXNl
IEFJIGNvbXBhbmllcyBoYXZlIGNoYW5nZWQgdGhlIHNvY2lhbCBjb250cmFjdCBhcm91bmQg
aG93IHdlYnNpdGUgaG9zdGluZyB3b3Jrcy4gQSBuby1KUyBzb2x1dGlvbiBpcyBhIHdvcmst
aW4tcHJvZ3Jlc3MuPC9wPjwvbm9zY3JpcHQ+PGRpdiBpZD0idGVzdGFyZWEiPjwvZGl2Pjwv
ZGl2Pjxmb290ZXI+PGNlbnRlcj48cD5Qcm90ZWN0ZWQgYnkgPGEgaHJlZj0iaHR0cHM6Ly9n
aXRodWIuY29tL1RlY2hhcm9IUS9hbnViaXMiPkFudWJpczwvYT4gZnJvbSA8YSBocmVmPSJo
dHRwczovL3RlY2hhcm8ubG9sIj5UZWNoYXJvPC9hPi4gTWFkZSB3aXRoIOKdpO+4jyBpbiDw
n4eo8J+Hpi48L3A+PHA+TWFzY290IGRlc2lnbiBieSA8YSBocmVmPSJodHRwczovL2Jza3ku
YXBwL3Byb2ZpbGUvY2VscGhhc2UuYnNreS5zb2NpYWwiPkNFTFBIQVNFPC9hPi48L3A+PC9j
ZW50ZXI+PC9mb290ZXI+PC9tYWluPjwvYm9keT48L2h0bWw+

--------------A0IZRVvHwU5LlAeVdmwBKEmr--

