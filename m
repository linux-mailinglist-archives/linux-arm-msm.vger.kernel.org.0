Return-Path: <linux-arm-msm+bounces-76924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FCBBD181C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 07:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A7F184E33EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 05:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707E92DD5E2;
	Mon, 13 Oct 2025 05:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eLJRaRJN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEB72DA768
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 05:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760334578; cv=none; b=GnnGVqn6J4aAAbxnWho3pzY2MhHSFRGS9xfnwK17mXZByxDKUxFz6SilDTGb2yUWzltr0bdBjH005Am6neLZLRWIfIRAmrSMOE4r1BtHMuAGQ7lFD05oRPO3Kx0RdgaDllrNIxJsGOOmWNLmzMVs5NXdGNmjdw9SDSGJKUbP80o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760334578; c=relaxed/simple;
	bh=3RKQwOEptiAv133lG3YSmIsZ4i/RJjYhpo00yHT1s1A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DStRXuE91c9yXK9MrwObUFyrHbmpAinnF/Jccb5EM7fPuNJOBdhNP4lgOi+pd0JQMmsTsmk6hvFbvRutq7AUTNA8PogX8PNHx0bLyv6r05s6bN0G4q08jPRYNKsJ7jZAJ8rT2NuFKW1hF9Vt5feiqpcZhFqL4TuG1JAgdYw+Tqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eLJRaRJN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2n3H7032708
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 05:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fY7Iv5HiOuXCaTEk7ZDBao
	mQOL5sTCapdPV8PvNrHLM=; b=eLJRaRJN/3ZglRajG6RarKYEat1dB+oYJ0towK
	FMoqMwsdyG+gcW2xxzxOS7/bwnPf3rU8USib9LvbctHS7gZPeK6ddICJNWjON8w+
	4LoRnRVTvLLj2+NzDreIJqWzEeV2bXyuLBXoXjEWZrLdxkQYar3YqmuCeHHIAlfX
	rD5SNaI6zHamLEuPiLQNUbzIIaXs8OCUQojkUxoUtTVBrVZX6aBSHn3OZRDLsAAy
	EHHZGAAewD/3R4VQ+ycpfH9Is4WNxQHWliAQ14KPKQK8Ao/+FTwoDOWZGeFE9xxp
	nAQB5ubY4hPB0aLdliMDWNsMCsmzc5xG7ac71L2mmohCynXg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd8ud3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 05:49:35 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2eb787f2so6592478b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 22:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760334575; x=1760939375;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fY7Iv5HiOuXCaTEk7ZDBaomQOL5sTCapdPV8PvNrHLM=;
        b=HBJ0HwUKHpOknJ0vtq83kX5IbCsaICUMpzIkmzLd0U+Ee7WsobUwM+sNMzv35N7/F3
         klanHqwBa+safBtEWRZWf3deJcexLI+yTFlrAdrATf59i3GXoXOYIXUI5W6sUSol4N+T
         M/u2+89UnK3dTMwxEUUiQjFSce1nUs2xS9d3d3suKtsA996tlZB9id2NKDLWW0XIMQXN
         a4ds3O91G8MixNmSBr+LSalp3PERCSTgmjuUuRE5oHXgsaHI7/Oitoytm4I3xQpJkzSr
         +kkan9qr81a4b3buqjj+2m2zpjU5EByV06huHiZwHRMCGndXoRuRAW0DFAQ1b/onlNHm
         yV0w==
X-Forwarded-Encrypted: i=1; AJvYcCWMhN0T1cqAgOspIRQkzpyuuKASycLw6hCrDqusVzXYgJcHJlA6qInoLTcVr8e6YK15t7Wo9MNGEZ1yYRQR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/G+qn4TWXyQKyYBTjPEfRJwIk5zARuUbxT57n29EjYX2zizti
	f/dhc8+Bm0Fvd+tjcZzoae+bYsHvYD+iuUm4CK1kKXKqbhYECvOUx+C2ikILW9SlmG+uBDIdR16
	ufjcA+0DOhDF4IRMYTkiMiQSLpCQ4o8zvDKLRNY+nBTjAbAzKgQQROngxYh84CWwjYJ5d
X-Gm-Gg: ASbGncuVBPY29shC0w6W42er7aUaOGw8ALj1b/pPFTwcFBzYb2rj4v8sCPqzX1V6uGO
	7ZDNl5zP+GXygdHl4nkEyAJfFI44N9MrQdTZVSRTMs/XAwZxfImotcQeZ7QexD/SRihq4MUml6a
	qfOT8TbueAm4HKYLFOa1/OfhnlvRSEPbbB+4HUA+zKfBEruMV36am1IEE2NH2Ah56ASGJ+csPcF
	xmJzs7Cohxh0odsMX8XEE6TlIsgp8roBEM5zsHWAmAV9B1+2s4qyzQ2R2lwQ9YIcEL9OiD5ztYw
	Y1qx6wkDj5QWGfq1fkLaaRL7tJLRuEuxcHQAJTxrnJh2uybUiQCxg4q6hcJG5XXSAI2SABTi9JT
	FRNHjGtx/3eUCisa1zu9tcMqdRXs=
X-Received: by 2002:a05:6a20:a103:b0:2e3:dd60:913d with SMTP id adf61e73a8af0-32da8163cc9mr24914839637.21.1760334574823;
        Sun, 12 Oct 2025 22:49:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOoDpVGBojfst5I0YQOYF1+bRjx9a9Tuv9XIbuIgq6zeW3tKYZ9hhUWXzKY+tbbVHfBf5rvQ==
X-Received: by 2002:a05:6a20:a103:b0:2e3:dd60:913d with SMTP id adf61e73a8af0-32da8163cc9mr24914811637.21.1760334574294;
        Sun, 12 Oct 2025 22:49:34 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e1336sm10129898b3a.59.2025.10.12.22.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 22:49:33 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v7 0/9] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
Date: Mon, 13 Oct 2025 13:49:09 +0800
Message-Id: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANeS7GgC/x3MQQqEMAxA0atI1gasoqVeRVy0NWpAqqSdQRHvb
 nH5Fv/fEEmYIvTFDUJ/jryHDF0W4FcbFkKesqGu6lZVqkEK1m2E7kqEPiTBeRf0yf+wU8Y4bZT
 T2kLuD6GZz+89jM/zAnYFCDhrAAAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760334566; l=5780;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=3RKQwOEptiAv133lG3YSmIsZ4i/RJjYhpo00yHT1s1A=;
 b=PLX89PMzNJKlz/9WHLi1kmyLD2wcl0akbD4i7ancQTZT4sbKMaCz7piWWaDXjH3GYZTpntAUj
 0RkbCfUhxbHCe0NRI3Xd9NSSxvS5ye1iMvO30OB5KcpY5Vg1Lxr4vUZ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: 4i922h8C7-_TMY9u3GBHZlME4DGY-aIe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX1XQm0BawEFkc
 lbeNp5s1BnCROoedjfPzcO5YQqtNezX0QCtedSOnyMTbF/USlRbW5zM7MMDhp7lgsZKGUF27uT4
 OCNarhFZ0+41auBu14/kUxvCB/Jd0p6AG0403MPNIp5vh7jQc4mJRyzdlinEsAAj/4hCGPbS45U
 nrWfT5jQOoBSAE/eVRQDoS2P1dOiKRMbGDfnlRNnd5SFSyFCEMXcRYmLHnHwvP6Z+BmirsHC/3F
 7SE7dqr/nKXiY+sQ+B5t+yVF8wVV1TrIotprDAhZhJqyH2d4LZwMZB0ruwRWVHJ6uFr/lpb19vm
 btpXGhPUzBBp0ZEd8diyfxG4MzhdU+IvZc/Bmed0BtQ03GvX/jud5GyZT6AX885WlTvcoymlZij
 xSbQL2qfElDkQHgZteREth6kQ11mjA==
X-Proofpoint-GUID: 4i922h8C7-_TMY9u3GBHZlME4DGY-aIe
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ec92ef cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=4JJaRIKzVo7dG1xzKtwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

The byte-cntr function provided by the CTCU device is used to count the
trace data entering the ETR. An interrupt is triggered if the data size
exceeds the threshold set in the BYTECNTRVAL register. The interrupt
handler counts the number of triggered interruptions.

Based on this concept, the irq_cnt can be used to determine whether
the etr_buf is full. The ETR device will be disabled when the active
etr_buf is nearly full or a timeout occurs. The nearly full buffer will
be switched to background after synced. A new buffer will be picked from
the etr_buf_list, then restart the ETR device.

The byte-cntr reading functions can access data from the synced and
deactivated buffer, transferring trace data from the etr_buf to userspace
without stopping the ETR device.

The byte-cntr read operation has integrated with the file node tmc_etr,
for example:
/dev/tmc_etr0
/dev/tmc_etr1

There are two scenarios for the tmc_etr file node with byte-cntr function:
1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior

Shell commands to enable byte-cntr reading for etr0:
echo 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_threshold
echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
echo 1 > /sys/bus/coresight/devices/etm0/enable_source
cat /dev/tmc_etr0

Enable both ETR0 and ETR1:
echo 0x10000 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_threshold

Reset the BYTECNTR register for etr0:
echo 0 > /sys/bus/coresight/devices/ctcu0/irq_threshold

Changes in V7:
1. rebased on tag next-20251010
2. updated info for sysfs node document
Link to V6 - https://lore.kernel.org/all/20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com/

Changes in V6:
1. rebased on next-20250905.
2. fixed the issue that the dtsi file has re-named from sa8775p.dtsi to
   lemans.dtsi.
3. fixed some minor issues about comments.
Link to V5 - https://lore.kernel.org/all/20250812083731.549-1-jie.gan@oss.qualcomm.com/

Changes in V5:
1. Add Mike's reviewed-by tag for patchset 1,2,5.
2. Remove the function pointer added to helper_ops according to Mike's
   comment, it also results the patchset has been removed.
3. Optimizing the paired create/clean functions for etr_buf_list.
4. Remove the unneeded parameter "reading" from the etr_buf_node.
Link to V4 - https://lore.kernel.org/all/20250725100806.1157-1-jie.gan@oss.qualcomm.com/

Changes in V4:
1. Rename the function to coresight_get_in_port_dest regarding to Mike's
comment (patch 1/10).
2. Add lock to protect the connections regarding to Mike's comment
(patch 2/10).
3. Move all byte-cntr functions to coresight-ctcu-byte-cntr file.
4. Add tmc_read_ops to wrap all read operations for TMC device.
5. Add a function in helper_ops to check whether the byte-cntr is
enabkled.
6. Call byte-cntr's read_ops if byte-cntr is enabled when reading data
from the sysfs node.
Link to V3 resend - https://lore.kernel.org/all/20250714063109.591-1-jie.gan@oss.qualcomm.com/

Changes in V3 resend:
1. rebased on next-20250711.
Link to V3 - https://lore.kernel.org/all/20250624060438.7469-1-jie.gan@oss.qualcomm.com/

Changes in V3:
1. The previous solution has been deprecated.
2. Add a etr_buf_list to manage allcated etr buffers.
3. Add a logic to switch buffer for ETR.
4. Add read functions to read trace data from synced etr buffer.
Link to V2 - https://lore.kernel.org/all/20250410013330.3609482-1-jie.gan@oss.qualcomm.com/

Changes in V2:
1. Removed the independent file node /dev/byte_cntr.
2. Integrated the byte-cntr's file operations with current ETR file
   node.
3. Optimized the driver code of the CTCU that associated with byte-cntr.
4. Add kernel document for the export API tmc_etr_get_rwp_offset.
5. Optimized the way to read the rwp_offset according to Mike's
   suggestion.
6. Removed the dependency of the dts patch.
Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (9):
      coresight: core: Refactoring ctcu_get_active_port and make it generic
      coresight: core: add a new API to retrieve the helper device
      coresight: tmc: add etr_buf_list to store allocated etr_buf
      coresight: tmc: add create/clean functions for etr_buf_list
      coresight: tmc: Introduce sysfs_read_ops to wrap sysfs read operations
      dt-bindings: arm: add an interrupt property for Coresight CTCU
      coresight: ctcu: enable byte-cntr for TMC ETR devices
      coresight: tmc: integrate byte-cntr's read_ops with sysfs file_ops
      arm64: dts: qcom: lemans: Add interrupts to CTCU device

 .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   6 +
 .../bindings/arm/qcom,coresight-ctcu.yaml          |  17 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   5 +
 drivers/hwtracing/coresight/Makefile               |   2 +-
 drivers/hwtracing/coresight/coresight-core.c       |  59 ++++
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 368 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 108 ++++--
 drivers/hwtracing/coresight/coresight-ctcu.h       |  62 +++-
 drivers/hwtracing/coresight/coresight-priv.h       |   4 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 104 ++++--
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 112 +++++++
 drivers/hwtracing/coresight/coresight-tmc.h        |  37 +++
 12 files changed, 825 insertions(+), 59 deletions(-)
---
base-commit: 2b763d4652393c90eaa771a5164502ec9dd965ae
change-id: 20251013-enable-byte-cntr-for-ctcu-6199b791b77a

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


